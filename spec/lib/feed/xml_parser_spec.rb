require "rails_helper"

describe Feed::XmlParser do
  let(:parser) do
    xml = file_fixture("feed_01.xml").read
    described_class.new(xml: xml, source_name: "feed_01")
  end

  describe "#feed" do
    it "returns a hash with PhysicalProperty key" do
      subject = parser.feed

      expect(subject).to be_kind_of Hash
      expect(subject.keys).to eq ["PhysicalProperty"]
    end
  end

  describe "#apartments" do
    it "returns an array of Feed::Apartment objects" do
      subject = parser.apartments

      # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/all-matcher
      expect(subject).to all(be_an(Feed::Apartment))
    end
  end
end
