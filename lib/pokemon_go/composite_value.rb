module PokemonGo
  CompositeValue = Struct.new(:pokemon, :level) do
    def attack(value)
      calculate(pokemon.attack + value)
    end

    def defense(value)
      calculate(pokemon.defense + value)
    end

    def stamina(value)
      calculate(pokemon.stamina + value)
    end

    def multiplier
      BaseStats.cp_multiplier_by_level(level)
    end

    private

    def calculate(value)
      value * multiplier
    end
  end
end
