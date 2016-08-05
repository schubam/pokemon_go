require_relative "../spec_helper"

module PokemonGo
  describe Pokemon do
    before do
      @pikachu = Pokemon.new("pikachu", :pikachu, 132, 26, 600, true)
    end

    it "can be instantiated" do
      @pikachu.must_be_instance_of(Pokemon)
    end

    it "#min_level" do
      @pikachu.min_level.must_equal 5
    end

    it "#max_level" do
      @pikachu.max_level.must_equal 6.5
    end

    describe "#levels" do
      it "interpolates for trained" do
        @pikachu.leveled = true
        @pikachu.levels.sort.must_equal [5, 5.5, 6, 6.5]
      end

      it "interpolates for non-trained" do
        @pikachu.leveled = false
        @pikachu.levels.sort.must_equal [5, 6]
      end
    end

    describe "#stats" do
      it "stats" do
        @pikachu.stats.must_be_instance_of Stat
      end
      it "attack" do
        @pikachu.attack.must_equal 124
      end
      it "defense" do
        @pikachu.defense.must_equal 108
      end
      it "stamina" do
        @pikachu.stamina.must_equal 70
      end
      it "evolution" do
        @pikachu.evolution.must_equal :raichu
      end
    end

    it ".min_hp" do
      level = 5.5
      Pokemon.min_hp(:pikachu, level).must_equal 21
      level = 6.5
      Pokemon.min_hp(:pikachu, level).must_equal 23
    end

    it ".max_hp" do
      level = 5.5
      Pokemon.max_hp(:pikachu, level).must_equal 26
      level = 6.5
      Pokemon.max_hp(:pikachu, level).must_equal 28
    end 
  end
end

