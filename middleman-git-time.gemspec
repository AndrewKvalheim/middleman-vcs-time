# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |gem|
  gem.name     = 'middleman-git-time'
  gem.version  = '0.0.1'
  gem.platform = Gem::Platform::RUBY
  gem.authors  = ['Andrew Kvalheim']
  gem.email    = ['Andrew@Kvalhe.im']
  gem.homepage = 'https://github.com/AndrewKvalheim/middleman-git-time'
  gem.summary  = %q{Look up last-modified times of Middleman resource from Git.}

  gem.files         = `git ls-files -z`.split("\0")
  gem.test_files    = gem.files.grep(%r{^(features|fixtures)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'middleman-core', ['>= 3.2.0']
end
