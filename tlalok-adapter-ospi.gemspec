# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tlalok/adapter/ospi/version'

Gem::Specification.new do |spec|
  spec.name          = "tlalok-adapter-ospi"
  spec.version       = Tlalok::Adapter::Ospi::VERSION
  spec.authors       = ["defektive"]
  spec.email         = ["sirbradleyd@gmail.com"]

  spec.summary       = %q{gem for controlling an open sprinkler pi http://rayshobby.net/ospi/}
  spec.homepage      = "https://github.com/tlalok-sprinklers/tlalok-adapter-ospi"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.19"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
