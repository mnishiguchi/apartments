require "rails_helper"

describe Feed::Importer do
  describe "#call" do
    it "returns true" do
      subject = described_class.new.call(
        source_names: [described_class::SOURCE_NAMES.sample]
      )

      expect(subject).to be true
    end
  end
end
