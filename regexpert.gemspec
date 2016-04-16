# -*- encoding: utf-8 -*-
require_relative "./version"

Gem::Specification.new do |s|
  s.name                  = "regexpert"
  s.version               = Regexpert.version
  s.authors               = ["Dana Scheider"]
  s.description           = "Regex in, string out"
  s.summary               = "rambo-#{s.version}"
  s.email                 = "dana.scheider@gmail.com"
  s.license               = "MIT"
  s.platform              = Gem::Platform::RUBY
  s.required_ruby_version = ">= 2.1.0"

  s.add_development_dependency "rspec", "~> 3.3"
  s.add_development_dependency "coveralls", "~> 0.7"
  s.add_development_dependency "rake", "~> 10.4"

  s.rubygems_version   = ">= 1.6.1"
  s.files              = `git ls-files`.split("\n").reject {|path| path =~ /\.gitignore$/ }
  s.test_files         = `git ls-files -- {spec,features}/*`.split("\n")
  s.rdoc_options       = ["--charset=UTF-8"]
  s.require_path       = "lib"
end
