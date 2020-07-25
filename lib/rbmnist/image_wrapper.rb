class Rbmnist::ImageWrapper

    WIDTH = 28
    HEIGHT = 28

    attr_reader :data

    def initialize(data)
        @data = data
    end

    def pixels
        @data
    end

    def to_a
        return data
    end

    def [](arg)
        @data[arg]
    end

    def []=(val, newval)
        @data[val] = newval
    end

    def each(&block)
        @data.each(&block)
    end

    def map(&block)
        @data.map(&block)
    end

    def to_a_2d
        Array.new(HEIGHT) do |row|
            rowstart = row * WIDTH
            rowend = rowstart + WIDTH
            @data[rowstart...rowend]
        end
    end

    def to_png
        Rbimg::PNG.new(pixels: @data, type: :greyscale, width: WIDTH, height: HEIGHT)
    end
end