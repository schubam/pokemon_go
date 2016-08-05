module PokemonGo
  Pokemon = Struct.new(:name, :type, :cp, :hp, :dust, :leveled) do
    MIN_LEVEL = 0
    MAX_LEVEL = 16

    def self.levels
      (MIN_LEVEL...MAX_LEVEL)
    end

    def self.min_hp(type, level)
      hp(type, level, MIN_LEVEL)
    end

    def self.max_hp(type, level)
      hp(type, level, MAX_LEVEL)
    end

    def leveled?
      leveled == true
    end

    def max_level
      @max_level ||= get_levels.first
    end

    def min_level
      @min_level ||= get_levels.last
    end

    def levels
      min_level.step(to: max_level,
                     by: leveled? ? 0.5 : 1).to_a
    end

    def stats
      @stats ||= BaseStats.for(type)
    end

    def attack
      stats.attack
    end

    def defense
      stats.defense
    end

    def stamina
      stats.stamina
    end

    def evolution
      stats.evolution
    end

    def health(level, value)
      Pokemon.hp(type, level, value)
    end

    def to_s(*args)
      "'#{name}' <#{type.to_s.upcase}> cp: #{cp}, hp: #{hp}, dust: #{dust}, leveled: #{leveled}"
    end

    private

    def get_levels
      BaseStats.levels_for_dust(dust)
    end

    def self.hp(type, level, value)
      p = Pokemon.new("", type)
      s = CompositeValue.new(p, level).stamina(value)
      [10, s].max.floor
    end
  end
end

