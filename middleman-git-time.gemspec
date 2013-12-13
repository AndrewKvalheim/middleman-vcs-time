# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'middleman-git-time'
  gem.version     = '0.0.1'
  gem.platform    = Gem::Platform::RUBY
  # gem.authors     = ['Your Name']
  # gem.email       = ['email@example.com']
  # gem.homepage    = 'http://example.com'
  # gem.summary     = %q{A short summary of your extension}
  # gem.description = %q{A longer description of your extension}

  gem.files         = `git ls-files -z`.split("\0")
  gem.test_files    = gem.files.grep(%r{^(features|fixtures)/})
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'middleman-core', ['>= 3.2.0']
end
