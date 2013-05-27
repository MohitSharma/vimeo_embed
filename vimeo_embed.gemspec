# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vimeo_embed/version'

Gem::Specification.new do |gem|
  gem.name          = "vimeo_embed"
  gem.version       = VimeoEmbed::VERSION
  gem.authors       = ["Mohit Sharma"]
  gem.email         = ["developer.pht@gmail.com"]
  gem.description   = %q{Embedding vimeo videos}
  gem.summary       = %q{Embedding vimeo videos}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
