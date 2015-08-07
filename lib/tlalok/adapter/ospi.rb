require "tlalok/adapter/ospi/version"
require 'thor'

begin
  require 'wiringpi'
rescue LoadError
  require 'tlalok/adapter/ospi/wiringpi'
end

module Tlalok
  module Adapter
    module Ospi

    end
  end
end

require 'tlalok/adapter/ospi/cli'
require 'tlalok/adapter/ospi/controller'
