lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'srm_token/version'

Gem::Specification.new do |gem|
  gem.name          = "srm_token"
  gem.version       = SrmToken::VERSION
  gem.authors       = ["Leo Jiang", "Natalie You", "Quan Yuan"]
  gem.email         = ["leo.jiang@oracle.com"]
  gem.description   = %q{Authorized SRM request through Gatekeeper.}
  gem.summary       = %q{Ruby SRM Library}
  gem.homepage      = ""
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec', '~>2.12.0'
  gem.add_development_dependency 'vcr', '~>2.4.0'
  gem.add_development_dependency 'webmock', '~>1.9.0'
  gem.add_development_dependency 'json'
  gem.add_development_dependency 'rest-client'
end