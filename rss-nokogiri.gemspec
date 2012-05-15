# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rss/nokogiri', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["KITAITI Makoto"]
  gem.email         = ["KitaitiMakoto@gmail.com"]
  gem.description   = %q{Enable starndard bundled RSS library to use Nokogiri as a parser}
  gem.summary       = %q{Enable RSS to use Nokogiri}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rss-nokogiri"
  gem.require_paths = ["lib"]
  gem.version       = RSS::NokogiriParser::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'yard'
  gem.add_development_dependency 'redcarpet'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'pry-doc'
  gem.add_runtime_dependency 'nokogiri'
end
