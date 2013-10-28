# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "ffiddler"
  spec.version       = File.read(File.join(File.dirname(__FILE__), 'ffiddler.version')).chomp
  spec.authors       = ["Steve Eley"]
  spec.email         = ["sfeley@gmail.com"]
  spec.description   = %q{ffiddler reimplement the defunct FFI gem's API on top of the 'fiddle' standard library, to ease migration for the many projects caught off guard by the Ruby-FFI maintainer's withdrawal of support and documentation.}
  spec.summary       = %q{Bridge gem to convert Ruby FFI calls to the built-in Fiddle standard library}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
