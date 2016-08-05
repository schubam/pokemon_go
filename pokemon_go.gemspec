# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pokemon_go/version'

Gem::Specification.new do |spec|
  spec.name          = "pokemon_go"
  spec.version       = PokemonGo::VERSION
  spec.license       = "GPL-3"
  spec.authors       = ["Marc Schuba"]
  spec.email         = ["me@schubam.com"]

  spec.summary       = %q{Calculate the hidden individual values (IV) of your Pokémon in Pokémon Go.}
  spec.description   = %q{In Pokémon GO, IVs have a range of 0 to 15. Pokémon have an IV for each of their three basic stats: HP, Attack, and Defense. In Pokémon GO, IVs are the only factor that can distinguish one Pokémon's stats from another's of the same species if they have the same Power Up level.
Pokémon hatched from Eggs have a high chance of having high IVs.
This gem has been ported from a Google Spreadsheet (https://docs.google.com/spreadsheets/d/1Ut8fmEYRokyQa9pQEDbAuFtpKOCTS54tQ9K7fU1LveI/edit#gid=1812532592).}
  spec.homepage      = "https://github.com/schubam/pokemon_go"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.9"
  spec.add_development_dependency "minitest-color", "~> 0.0.2"
  spec.add_development_dependency "pry", "~> 0.10"
end
