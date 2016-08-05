require_relative "../spec_helper"

module PokemonGo
  describe Trainer do
    it "#max_level" do
      trainer = Trainer.new(11)
      pikachu = Pokemon.new("pikachu", :pikachu, 132, 26, 600, true)
      trainer.max_level(pikachu).must_equal 6.5
    end
  end
end
