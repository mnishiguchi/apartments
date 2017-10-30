require "rails_helper"

RSpec.describe SearchFilterSubpathBuilder do
  describe "#build" do
    let(:builder) { described_class.new }

    context "only primary filter applied" do
      it "returns correct hash" do
        expect(builder.build(bedroom_count: 0.5)).to eq("studio")
        expect(builder.build(bedroom_count: 1.0)).to eq("1-bed")
        expect(builder.build(bedroom_count: 1.0, pet: "ok")).to eq("1-bed_pet-friendly")
        expect(builder.build(bedroom_count: 1.0, bathroom_count: 1.0, pet: "ok")).to eq("1-bed_1-bath_pet-friendly")
        expect(builder.build(rent: { min: 700 })).to eq("over-700")
        expect(builder.build(rent: { max: 1500 })).to eq("under-1500")
        expect(builder.build(rent: { min: 700, max: 1500 })).to eq("700-to-1500")
        expect(builder.build(rent: { min: 700, max: 1500 }, pet: "dog")).to eq("700-to-1500_pet-friendly-dog")
        expect(builder.build(rent: { min: 700, max: 1500 }, pet: "cat")).to eq("700-to-1500_pet-friendly-cat")
        expect(builder.build(rent: { min: 700, max: 1500 }, pet: "ok")).to eq("700-to-1500_pet-friendly")
      end
    end

    context "only amenities applied" do
      it "returns correct hash" do
        expect(builder.build(amenities: ["air-conditioning",
                                         "washer-dryer",
                                         "dishwasher",
                                         "parking",
                                         "fitness-center",
                                         "wheelchair-accessible",
                                         "pool",
                                         "furnished",
                                         "elevator",
                                         "washer-dryer-hookup",
                                         "laundry-facilities"])).
          to eq("air-conditioning_washer-dryer_dishwasher_parking_fitness-center_"\
            "wheelchair-accessible_pool_furnished_elevator_washer-dryer-hookup_laundry-facilities")
      end
    end

    it "returns correct hash" do
      expect(builder.build(rent: { min: 500 }, pet: "dog", amenities: ["dishwasher", "parking"])).
        to eq("over-500_pet-friendly-dog/dishwasher_parking")
      expect(builder.build(rent: { min: 700, max: 1500 }, pet: "ok",
                             amenities: ["air-conditioning",
                                         "washer-dryer",
                                         "dishwasher",
                                         "parking",
                                         "fitness-center",
                                         "wheelchair-accessible",
                                         "pool",
                                         "furnished",
                                         "elevator",
                                         "washer-dryer-hookup",
                                         "laundry-facilities"])).
        to eq("700-to-1500_pet-friendly/air-conditioning_washer-dryer_dishwasher_parking_fitness-center_"\
          "wheelchair-accessible_pool_furnished_elevator_washer-dryer-hookup_laundry-facilities")
    end
  end
end
