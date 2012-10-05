# -*- encoding: utf-8 -*-
require File.expand_path('../lib/xid/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Adam Meehan"]
  gem.email         = ["adam.meehan@gmail.com"]
  gem.description   = %q{Adds ability to ActiveRecord to retrieve the current transaction ID}
  gem.summary       = %q{Adds ability to ActiveRecord to retrieve the current transaction ID}
  gem.homepage      = "https://github/adzap/xid"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "xid"
  gem.require_paths = ["lib"]
  gem.version       = XID::VERSION
end
