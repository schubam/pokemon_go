module PokemonGo
  Combination = Struct.new(:attack, :defense, :stamina, :level, :pokemon) do
    def cp
      cv = CompositeValue.new(pokemon, level)
      s = cv.stamina(stamina)
      s1 = 0.1 * (s ** 0.5)
      a1 = cv.attack(attack)
      d1 = cv.defense(defense)
      d2 = d1 ** 0.5
      result = (s1 * a1 * d2).floor
      [10, result].max
    end

    def perfectness
      [attack, defense, stamina].reduce(:+) / 45.0
    end

    def to_s(*args)
      "L: #{level} / A: #{attack} / D: #{defense} / S: #{stamina}"
    end
  end
end
