# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'syspay-sdk/version'

Gem::Specification.new do |gem|
  gem.name          = "syspay-sdk"
  gem.version       = Syspay::SDK::VERSION
  gem.authors       = ["Fabien Anthonioz"]
  gem.email         = ["fabien.anthonioz@neteden.fr"]
  gem.summary       = %q{The Syspay REST SDK provides Ruby APIs to create, process and manage payment.}
  gem.description   = %q{The Syspay REST SDK provides Ruby APIs to create, process and manage payment.}
  gem.homepage      = "https://app.syspay.com/"

  gem.files         = Dir["{spec,lib}/**/*"] + ["Rakefile", "README.md", "Gemfile"]
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end