require "rbmnist/version"

require 'byteman'
require 'rbimg'
require 'zlib'

module Rbmnist

end

require_relative './concerns/unzippable' 
require_relative './rbmnist/image_wrapper'
require_relative './rbmnist/mnist'
