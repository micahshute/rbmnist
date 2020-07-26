class Rbmnist::MNIST


    def self.load
        load_test
        load_train
    end

    def self.load_test
        Test.images
        Test.labels
        nil
    end

    def self.load_train
        Train.images
        Train.labels
        nil
    end



    class Test

        IMAGE_COUNT = 10000
        CLEAN_IMAGE_COUNT = 5000

        extend Rbmnist::Unzippable

        @@images = []
        @@labels = []

        def self.images
            if @@images.length == 0
                img_bytes = unzip_from_path(__dir__ + '/../../data/t10k-images-idx3-ubyte.gz')
                curr_byte = 16
                @@images = Array.new(IMAGE_COUNT) do |pic|
                    Rbmnist::ImageWrapper.new(img_bytes[curr_byte...(curr_byte += 784)])
                end
            end
            @@images
        end

        def self.clean_images
            images[0...CLEAN_IMAGE_COUNT]
        end

        def self.clean_labels
            labels[0...CLEAN_IMAGE_COUNT]
        end

        def self.labels
            if @@labels.length == 0
                label_bytes = unzip_from_path(__dir__ + '/../../data/t10k-labels-idx1-ubyte.gz')
                curr_byte = 8
                @@labels = Array.new(IMAGE_COUNT) do |label|
                    label_bytes[curr_byte...(curr_byte += 1)].first
                end
            end
            @@labels
        end
    end

    class Train

        IMAGE_COUNT = 60000
        extend Rbmnist::Unzippable

        @@images = []
        @@labels = []

        def self.images
            if @@images.length == 0
                img_bytes = unzip_from_path(__dir__ + '/../../data/train-images-idx3-ubyte.gz')
                curr_byte = 16
                @@images = Array.new(IMAGE_COUNT) do |pic|
                    Rbmnist::ImageWrapper.new(img_bytes[curr_byte...(curr_byte += 784)])
                end
            end
            @@images
        end

        def self.labels
            if @@labels.length == 0
                label_bytes = unzip_from_path(__dir__ + '/../../data/train-labels-idx1-ubyte.gz')
                curr_byte = 8
                @@labels = Array.new(IMAGE_COUNT) do |label|
                    label_bytes[curr_byte...(curr_byte += 1)].first
                end
            end
            @@labels
        end


    end

end