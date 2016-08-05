require_relative "../spec_helper"

module PokemonGo
  describe CompositeValue do
    before do
      @pikachu = Pokemon.new("pikachu", :pikachu, 132, 26, 600, true)
      level = 6.5
      @cv = CompositeValue.new(@pikachu, level)
    end

    it "can be instantiated" do
      @cv.must_be_instance_of(CompositeValue)
    end

    it "#multiplier" do
      @cv.multiplier.must_be_close_to 0.335
      @cv.level = 3.5
      @cv.multiplier.must_be_close_to 0.236
    end

    describe "#attack" do
      it "has values" do
        @cv.attack(1).must_be_close_to 41.930
        @cv.level = 3
        @cv.attack(12).must_be_close_to 29.339
      end
    end

    describe "#defense" do
      it "has values" do
        @cv.defense(1).must_be_close_to 36.563
        @cv.level = 3
        @cv.defense(12).must_be_close_to 25.887
      end
    end

    describe "#stamina" do
      it "has values" do
        @cv.stamina(1).must_be_close_to 23.816
        @cv.level = 3
        @cv.stamina(12).must_be_close_to 17.690
      end
    end
  end
end
