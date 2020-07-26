# Rbmnist

Quick, easy way to get MNIST data in ruby without downlaoding, unzipping, and processing it yourself. 

The Train set has 60000 images in it with associated labels. The test set has 10000 images in it with associated labels.
The first 5000 images of the test set are clearer than the last 5000, and can be accessed simply (see below)

Allows access to image pixel data, and easy visualization (see examples and below).

Supports lazy loading.

Images are wrapped in an Rbmnist::ImageWrapper object, which mirrors many array methods ([], []=, each, and map). 
The raw pixel array can be retreived via #data and #pixel

Labels are simply an array of integers

To load: 
```ruby
Rbmnist::MNIST.load # Load everything
Rbmnist::MNIST.load_test # Load just test images and labels
Rbmnist::MNIST.load_train # Load just the train images and labels
```
Otherwise, the applicable data will be loaded when it is accessed:

```ruby
Rbmnist::MNIST::Test.images # this will load only the test images and then return them as an array of Rbmnist::ImageWrapper objects
Rbmnist::MNIST::Train.labels # this will load only the train labels and return them as an array of integers
```

Basic usage:

```ruby
#Can load everything or lazy load when you need it, like above
require 'rbmnist'

Rbmnist::MNIST.load

train_imgs = Rbmnist::MNIST::Train.images
train_labels = Rbmnist::MNIST::Train.labels

test_imgs = Rbmnist::MNIST::Test.images
test_labels = Rbmnist::MNIST::Test.labels

clean_test_images = Rbmnist::MNIST::Test.clean_images # the first 5000 images from the Test data is cleaner
clean_test_labels = Rbmnist::MNIST::Test.clean_labels # Note that clean_images and clean_labels use the #images and #labels methods, so they lazy load as well


# Images are Rbmnist::ImageWrapper objects. You can operate on their pixels directly or use methods to alter your data type

#Direct manipulation

train_img = train_imgs.first
first_20_pixels = train_img[0...20]
train_img.each do |pixel|
    # do something to each pixel
end

train_img.map do |pixel|
    # map each pixel
end

# Turn ImageWrapper into an array or a PNG:

img_pixel_array = train_img.to_a # or train_img.pixels or train_img.data

img_pixel_2d_array = train_img.to_a_2d # returns 2d array representing the rows/columns of pixels in image

png = train_img.to_png
png.write(path: "./my_mnst_img")

puts "The image my_mnst_img.png should be a #{train_labels.first}"

```





## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rbmnist'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rbmnist


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/micahshute/rbmnist. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/micahshute/rbmnist/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rbmnist project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rbmnist/blob/master/CODE_OF_CONDUCT.md).
