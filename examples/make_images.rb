require './lib/rbmnist'

Rbmnist::MNIST.load_test
Rbmnist::MNIST::Test.images.take(5).map(&:to_png).each.with_index do |png, i|
    png.write(path: "./mnist-#{i}")
end