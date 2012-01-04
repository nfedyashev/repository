# encoding: utf-8

Gem::Specification.new do |gem|
  gem.add_dependency 'active_support', [">= 0"]
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'

  gem.authors = ["Alex Chaffee", "Nikita Fedyashev"]
  gem.description = %q{A Repository mediates between the domain and data mapping layers, acting like an in-memory domain object collection.}
  gem.email = 'loci.master@gmail.com'
  gem.files = `git ls-files`.split("\n")
  gem.homepage = 'http://github.com/nfedyashev/repository'
  gem.name = 'treqsury'
  gem.require_paths = ['lib']
  gem.extra_rdoc_files = ['README.md']
  gem.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if gem.respond_to? :required_rubygems_version=
  gem.summary = %q{A Ruby implementation of the Repository Pattern}
  gem.test_files = `git ls-files -- spec/*`.split("\n")
  gem.version = '0.0.1'
end

