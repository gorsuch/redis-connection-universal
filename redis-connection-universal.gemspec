# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.authors       = ["Michael Gorsuch"]
  gem.email         = ["michael.gorsuch@gmail.com"]
  gem.description   = %q{universal redis driver to connect that allows for multiple transports}
  gem.summary       = gem.description
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "redis-connection-universal"
  gem.require_paths = ["lib"]
  gem.version       = '0.0.1'
  gem.add_dependency("redis")
end
