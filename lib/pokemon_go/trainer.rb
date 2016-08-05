module PokemonGo
  Trainer = Struct.new(:level) do
    def max_level(pokemon)
      [pokemon.max_level, level].min
    end 
  end
end

