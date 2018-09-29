
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "train_info_kanto/version"

Gem::Specification.new do |spec|
  spec.name          = "train_info_kanto"
  spec.version       = TrainInfoKanto::VERSION
  spec.authors       = ["shifumin"]
  spec.email         = ["shifumin4230@gmail.com"]

  spec.summary       = "Gem for getting train information in the Kanto area"
  spec.description   = "This is a gem to help you " +
                       "get train operating information in the Kanto area"
  spec.homepage      = "https://github.com/shifumin/train_info_kanto"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "nokogiri"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "pry-stack_explorer"
  spec.add_development_dependency "tapp"
end
