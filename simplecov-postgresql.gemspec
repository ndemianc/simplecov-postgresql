# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "simplecov-postgresql"
  s.version     = '0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sergii Demianchuk"]
  s.email       = ["sergeydemjanchyk@gmail.com"]
  s.homepage    = "https://github.com/ndemianc/simplecov-postgresql"
  s.summary     = %Q{Postgresql formatter for SimpleCov code coverage tool for ruby 1.9+}
  s.description = %Q{Postgresql formatter for SimpleCov code coverage tool for ruby 1.9+}

  s.rubyforge_project = "simplecov-postgresql"
  s.files         = ['lib/simplecov-postgresql.rb']
  s.test_files    = ['test/helper.rb', 'test/test_simplecov_postgresql.rb']
  s.require_paths = ["lib"]

  s.add_dependency 'simplecov'
  s.add_dependency 'pg', '~> 0.20'
  s.add_dependency 'activerecord', '~> 5.1', '>= 5.1.3'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'activerecord-nulldb-adapter'
  s.add_development_dependency 'mocha', '~> 1.3.0'
  s.add_development_dependency 'test-unit'
end
