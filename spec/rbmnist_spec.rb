RSpec.describe Rbmnist do
  it "has a version number" do
    expect(Rbmnist::VERSION).not_to be nil
  end

  it "allows lazy loading" do 
    expect(Rbmnist::MNIST::Test.class_variable_get("@@images").length).to be(0)
    test_images = Rbmnist::MNIST::Test.images
    expect(test_images.length).to be > 0
    expect(Rbmnist::MNIST::Test.class_variable_get("@@images").length).to be > 0
  end

  it "correctly unzips and presents MNIST data to the user" do
    Rbmnist::MNIST.load
    test_index = 32
    test_32_ans = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 132, 255, 225, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 128, 246, 183, 128, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 91, 254, 134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 54, 235, 204, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 158, 252, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 251, 165, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 107, 254, 138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 182, 229, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 232, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 133, 254, 105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 216, 254, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 227, 194, 3, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 58, 254, 115, 0, 0, 0, 0, 25, 139, 155, 242, 235, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 58, 254, 75, 0, 0, 0, 83, 224, 251, 155, 152, 254, 211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 58, 254, 104, 0, 0, 82, 249, 217, 60, 0, 37, 254, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 58, 254, 72, 0, 18, 247, 159, 14, 0, 7, 201, 254, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35, 239, 147, 1, 5, 155, 72, 0, 4, 193, 253, 122, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 216, 254, 97, 0, 0, 13, 73, 225, 254, 121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 79, 244, 248, 226, 226, 231, 254, 243, 115, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 114, 177, 254, 254, 235, 152, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    expect(Rbmnist::MNIST::Train.images[32].pixels).to eq(test_32_ans)
    expect(Rbmnist::MNIST::Train.labels[32]).to eq(6)
    expect(Rbmnist::MNIST::Test.labels.last).to eq(6)
  end

  it "returns ImageWrappers which allows the user to use basic array functions on it or turn it into a 1d or 2d array, or png" do
    r = Random.new
    randidx = r.rand(Rbmnist::MNIST::Train::IMAGE_COUNT)
    img = Rbmnist::MNIST::Train.images[randidx]
    expect(img).to be_a(Rbmnist::ImageWrapper)
    expect(img).to respond_to(:[])
    expect(img).to respond_to(:[]=)
    expect(img).to respond_to(:pixels)
    expect(img).to respond_to(:to_a)
    expect(img).to respond_to(:to_a_2d)
    expect(img).to respond_to(:each)
    expect(img).to respond_to(:map)
    expect(img.to_png).to be_a(Rbimg::PNG)
    expect(img.to_a_2d.first).to be_a(Array)
    expect(img.to_a).to be_a(Array)

  end



  it "allows easy use of just the clear test images" do 
    test_images = Rbmnist::MNIST::Test.images
    expect(test_images.length).to eq(Rbmnist::MNIST::Test::IMAGE_COUNT)
    clean_test_images = Rbmnist::MNIST::Test.clean_images
    expect(clean_test_images.length).to eq(Rbmnist::MNIST::Test::CLEAN_IMAGE_COUNT)
    expect(test_images.length).to be > clean_test_images.length
  end

end
