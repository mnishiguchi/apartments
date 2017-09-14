require "rails_helper"

describe Feed::PathList do
  describe ".for_feed_source" do
    it "returns a correct hash" do
      hash = described_class.for_feed_source("feed_01")

      expect(hash).to be_kind_of Hash
      expect(hash.keys).to match_array %i[apartments managements apartment floorplan]
    end

    it "raises an error for unsupported feed source" do
      expect {
        described_class.for_feed_source("bad_feed_source")
      }.to raise_error ArgumentError
    end
  end

  describe ".fetch_paths" do
    it "returns correct result for apartments key" do
      result = described_class.fetch_paths("feed_01", :apartments)

      expect(result).to eq [["PhysicalProperty", "Property"]]
    end

    it "returns non-nil result for managements key" do
      result = described_class.fetch_paths("feed_01", :managements)

      expect(result).to be_truthy
    end

    it "returns non-nil result for apartment key" do
      result = described_class.fetch_paths("feed_01", :apartment)

      expect(result).to be_truthy
    end

    it "returns non-nil result for floorplan key" do
      result = described_class.fetch_paths("feed_01", :floorplan)

      expect(result).to be_truthy
    end

    it "returns nil for unsupported key" do
      result = described_class.fetch_paths("feed_01", :unsupported)

      expect(result).to be nil
    end
  end
end
