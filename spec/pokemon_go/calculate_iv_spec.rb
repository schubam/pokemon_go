require_relative "../spec_helper"

module PokemonGo
  describe CalculateIV do
    before do
      @pikachu = Pokemon.new("pikachu", :pikachu, 132, 26, 600, true)
      @trainer = Trainer.new(11)
    end

    it "can be instantiated" do
      CalculateIV.new(@pikachu, @trainer).must_be_instance_of(CalculateIV)
    end

    describe "#calculate" do
      %i(type cp hp dust).each do |value|
        it "fails when `#{value}` value is blank" do
          pokemon = @pikachu.clone
          pokemon.send("#{value}=", nil)
          iv = CalculateIV.new(pokemon, @trainer)
          proc { iv.calculate }.must_raise CalculateIV::MissingValueError
        end
      end

      it "sets values for pikachu" do
        @calc = CalculateIV.new(@pikachu, @trainer)
        @calc.calculate
        @calc.combinations.count.must_be_close_to(88)
        @calc.min_perfectness.must_be_close_to(0.266)
        @calc.max_perfectness.must_be_close_to(0.977)
      end

      it "sets values for dratini" do
        @dratini = Pokemon.new("dratini", :dratini, 101, 24, 400, false)
        @calc = CalculateIV.new(@dratini, @trainer)
        @calc.calculate
        @calc.combinations.count.must_be_close_to(17)
        @calc.min_perfectness.must_be_close_to(0.911)
        @calc.max_perfectness.must_be_close_to(0.955)
      end
    end
  end
end
