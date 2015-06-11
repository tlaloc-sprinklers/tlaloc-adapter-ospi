require "tlaloc/adapter/ospi/version"
require 'thor'

begin
  require 'wiringpi'
rescue LoadError
  require 'tlaloc/adapter/ospi/wiringpi'
end

module Tlaloc
  module Adapter
    module Ospi

    end
  end
end

require 'tlaloc/adapter/ospi/cli'
require 'tlaloc/adapter/ospi/controller'
