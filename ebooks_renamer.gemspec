# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ebooks_renamer/version'
Gem::Specification.new do |spec|
  spec.name          = 'ebooks_renamer'
  spec.version       = EbooksRenamer::VERSION
  spec.authors       = ['Burin Choomnuan']
  spec.email         = ['agilecreativity@gmail.com']
  spec.summary       = %q{Bulk rename multiple ebook files (pdf, epub, mobi) using embedded metadata when available (pure ruby implementation)}
  spec.description   = %q{Bulk rename multiple ebook files (pdf, epub, mobi) using embedded metadata if available (pure ruby implementation)}
  spec.homepage      = 'https://github.com/agilecreativity/ebooks_renamer'
  spec.license       = 'MIT'
  spec.required_ruby_version = ">= 1.9.3"
  spec.files         = Dir.glob('{bin,lib}/**/*') + %w(Gemfile
                                                       Rakefile
                                                       ebooks_renamer.gemspec
                                                       README.md
                                                       CHANGELOG.md
                                                       LICENSE
                                                       .rubocop.yml
                                                       .gitignore)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.add_runtime_dependency 'thor', '~> 0.19'
  spec.add_runtime_dependency 'pdf-reader', '~> 2.1'
  spec.add_runtime_dependency 'mobi', '~> 1.0'
  spec.add_runtime_dependency 'epubinfo', '~> 0.4'
  spec.add_runtime_dependency 'filename_cleaner', '~> 0.4'
  spec.add_runtime_dependency 'agile_utils', '~> 0.2'
  spec.add_runtime_dependency 'code_lister', '~> 0.2'
  spec.add_development_dependency 'awesome_print', '~> 1.2'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'gem-ctags', '~> 1.0'
  spec.add_development_dependency 'guard', '~> 2.6'
  spec.add_development_dependency 'guard-minitest', '~> 2.3'
  spec.add_development_dependency 'minitest', '~> 5.4'
  spec.add_development_dependency 'minitest-spec-context', '~> 0.0'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rubocop', '~> 0.53'
  spec.add_development_dependency 'yard', '~> 0.9'
end
