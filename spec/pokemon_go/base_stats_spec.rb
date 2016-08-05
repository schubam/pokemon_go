require_relative "../spec_helper"

module PokemonGo
  describe BaseStats do
    it "gets the correct base_stats" do
      BaseStats.for(:pikachu).must_be_instance_of(Stat)
    end
  end
end
