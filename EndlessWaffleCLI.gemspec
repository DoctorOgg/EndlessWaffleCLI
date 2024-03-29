# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'EndlessWaffleCLI/version'

Gem::Specification.new do |spec|
  spec.name          = "EndlessWaffleCLI"
  spec.version       = EndlessWaffleCLI::VERSION
  spec.authors       = ["Dr. Ogg"]
  spec.email         = ["ogg@sr375.com"]

  spec.summary       = %q{Command line tools for the Endless Waffle server}
  spec.description   = %q{Command line tools for the Endless Waffle server}
  spec.homepage      = ""

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # spec.add_development_dependency "bundler", "~> 1.12"
  # spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "bundler", "~> 1.12"
  spec.add_dependency "rake", "~> 10.0"
  spec.add_dependency 'mime-types', '~> 3.1'
  spec.add_dependency 'unf_ext', '~> 0.0.7.2'
  spec.add_dependency 'unf', '~> 0.1.4'
  spec.add_dependency 'rest-client', '~> 2.0'
  spec.add_dependency 'console_table', '~> 0.2.4'
  spec.add_dependency 'colorize', '~> 0.8.1'
  spec.add_dependency 'net-ssh-multi', '~> 1.2', '>= 1.2.1'
  spec.add_dependency 'net-ssh-gateway', '~> 1.2'
  spec.add_dependency 'net-ssh', '~> 3.2'
  spec.add_dependency 'highline', '~> 1.7', '>= 1.7.8'
  spec.add_dependency 'eventmachine', '~> 1.2', '>= 1.2.0.1'
  spec.add_dependency 'em-http-request', '~> 1.1', '>= 1.1.5'
end
