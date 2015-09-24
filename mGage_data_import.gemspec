# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mGage_data_import/version'

Gem::Specification.new do |spec|
  spec.name          = "mGage_data_import"
  spec.version       = MGageDataImport::VERSION
  spec.authors       = ["Shanmuga Sundaram Sankara Pandian Muthu"]
  spec.email         = ["shan@telekomatrix.com"]

  spec.summary       = %q{Create a rails application to show the results for TV SMS voting campaigns,
derived from the log data similar to the attached tarball}
  spec.description   = %q{A command-line script that will import log file data into the application.
   Any lines that are not well-formed should be discarded. The sample data
   has been compressed to be emailed to you, but your script should assume
   the data is uncompressed plain text.}
  spec.homepage      = "http://www.telekomatrix.uk"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "Set to 'http://www.telekomatrix.co.uk'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'activerecord', '~> 4.2.4'
  spec.add_development_dependency 'mysql'
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "factory_girl", "~> 4.0"
end
