require "rails_helper"

RSpec.describe SearchFilterSubpathParser do
  describe "#parse" do
    let(:parser) { described_class.new }

    context "only primary filter applied" do
      it "returns correct hash" do
        expect(parser.parse("studio")).to eq(bedroom_count: 0.5)
        expect(parser.parse("1-bed")).to eq(bedroom_count: 1.0)
        expect(parser.parse("1-bed_pet-friendly")).to eq(bedroom_count: 1.0, pet: "ok")
        expect(parser.parse("1-bed_2-bath_pet-friendly")).
          to eq(bedroom_count: 1.0, bathroom_count: 2.0, pet: "ok")
        expect(parser.parse("over-700")).to eq(rent: { min: 700 })
        expect(parser.parse("under-1500")).to eq(rent: { max: 1500 })
        expect(parser.parse("700-to-1500")).to eq(rent: { min: 700, max: 1500 })
        expect(parser.parse("700-to-1500_pet-friendly-dog")).to eq(rent: { min: 700, max: 1500 }, pet: "dog")
        expect(parser.parse("700-to-1500_pet-friendly-cat")).to eq(rent: { min: 700, max: 1500 }, pet: "cat")
      end
    end

    context "only amenities filter applied" do
      it "returns correct hash" do
        subpath = "air-conditioning_washer-dryer_dishwasher_parking_fitness-center_"\
          "wheelchair-accessible_pool_furnished_elevator_washer-dryer-hookup_laundry-facilities"
        expect(parser.parse(subpath)).to eq(
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
                      "laundry-facilities"]
        )
      end
    end

    context "all filters applied" do
      it "returns correct hash" do
        subpath = "2-bed_3-bath_700-to-1500_pet-friendly/air-conditioning_washer-dryer_"\
          "dishwasher_parking_fitness-center_wheelchair-accessible_pool_furnished_elevator_"\
          "washer-dryer-hookup_laundry-facilities"
        expect(parser.parse(subpath)).to eq(
          bedroom_count: 2.0, bathroom_count: 3.0, rent: { min: 700, max: 1500 }, pet: "ok",
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
                      "laundry-facilities"]
        )
      end
    end
  end
end
