# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yhoshino11_todo/version'

Gem::Specification.new do |spec|
  spec.name          = "yhoshino11_todo"
  spec.version       = Yhoshino11Todo::VERSION
  spec.authors       = ["Yu Hoshino"]
  spec.email         = ["yhoshino11@gmail.com"]

  spec.summary       = %q{todo app with CLI.}
  spec.description   = %q{manage your todo with Terminal.}
  spec.homepage      = "https://github.com/yhoshino11/yhoshino11_todo.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
