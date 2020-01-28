# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-block/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-block"
  spec.version       = Jekyll::Block::VERSION
  spec.authors       = ["Maxime Kjaer"]
  spec.email         = ["maxime.kjaer@gmail.com"]

  spec.summary       = "Liquid tag for message boxes"
  spec.description   = 'Adds a "block" Liquid tag to generate HTML for message boxes in Jekyll'
  spec.homepage      = "https://github.com/MaximeKjaer/jekyll-block"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 2.3.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/MaximeKjaer/jekyll-block"
  spec.metadata["changelog_uri"] = "https://github.com/MaximeKjaer/jekyll-block/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|spec|features)/!) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r!^exe/!) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rubocop", ">= 0.68.0", "< 0.72.0"
  spec.add_development_dependency "rubocop-jekyll", "~> 0.10.0"

  spec.add_runtime_dependency "jekyll", ">= 3.6", "< 5.0"
end
