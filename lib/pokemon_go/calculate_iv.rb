module PokemonGo
  class CalculateIV
    class MissingValueError < RuntimeError; end;
    attr_reader :pokemon, :trainer, :combinations,
      :min_perfectness, :max_perfectness

    def initialize(pokemon, trainer)
      @pokemon = pokemon
      @trainer = trainer
    end

    def calculate
      raise MissingValueError if [pokemon.type, pokemon.cp, pokemon.hp, pokemon.dust].any?{|o| o.nil?}

      @combinations = find_combinations
      min, max = @combinations.minmax_by { |c| c.perfectness }.map(&:perfectness)
      @min_perfectness = [1.01, min].min
      @max_perfectness = [-0.01, max].max
    end

    def print_result
      puts "Pokemon: #{@pokemon}"
      printf "%.2f%% - %.2f%% perfectness\n", @min_perfectness*100, @max_perfectness*100
      puts "#{@combinations.count} combinations found"
      puts combinations
      puts
    end

    private

    def find_combinations
      @pokemon.levels.inject([]) do |memo, level|
        if pokemon_in_hp_range?(@pokemon, level)
          memo += combinations_for_level(level)
        end
        memo
      end
    end

    def pokemon_in_hp_range?(pokemon, level)
      min_hp = Pokemon.min_hp(pokemon.type, level)
      max_hp = Pokemon.max_hp(pokemon.type, level)
      pokemon.hp >= min_hp && pokemon.hp <= max_hp
    end

    def combinations_for_level(level)
      possible_staminas(level).
        product(Pokemon.levels.to_a, Pokemon.levels.to_a).
        map {|t| Combination.new(t[1], t[2], t[0], level, @pokemon)}.
        select {|t| t.cp == @pokemon.cp}
    end

    def possible_staminas(level)
      Pokemon.levels.select do |i|
        @pokemon.health(level, i) == @pokemon.hp
      end
    end
  end
end

