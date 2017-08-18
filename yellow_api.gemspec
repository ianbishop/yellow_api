require File.expand_path('../lib/yellow_api/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'yellow_api'
  gem.version     = YellowApi::VERSION
  gem.author      = 'Ian Bishop'
  gem.email       = 'ian.bishop@unb.ca'
  gem.homepage    = 'https://github.com/ianbishop/yellow_api'
  gem.summary     = %q{Wrapper for the YellowPages' Yellow API}
  gem.description = %q{Simple ruby wrapper for the YellowPages' Yellow API}

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.require_paths = ['lib']

  gem.add_development_dependency 'maruku'        , '~> 0.6'
  gem.add_development_dependency 'rake'          , '~> 0.9'
  gem.add_development_dependency 'rspec'         , '~> 2.6'
  gem.add_development_dependency 'simplecov'     , '~> 0.5.3'
  gem.add_development_dependency 'webmock'       , '~> 1.7.6'
  gem.add_development_dependency 'yard'          , '~> 0.7'
  gem.add_runtime_dependency     'faraday'           , '~> 0.7.4'
  gem.add_runtime_dependency     'faraday_middleware', '~> 0.7.0'
  gem.add_runtime_dependency     'hashie'            , '~> 2.0.2'
  gem.add_runtime_dependency     'multi_json'        , '~> 1.10.1'
  gem.add_runtime_dependency     'rash'              , '~> 0.4.0'
  gem.add_runtime_dependency     'uuid'              , '~> 2.3.5'
  gem.add_runtime_dependency     'activesupport'     , '>= 4.0.0'
end
