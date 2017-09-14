require "rails_helper"

describe Feed::PathResolver do
  describe ".call" do
    let(:feed_apartment) do
      # https://relishapp.com/rspec/rspec-rails/v/3-5/docs/file-fixture
      YAML.safe_load(file_fixture("feed_apartment.yml").read)
    end

    context "when a path can resolve to a value" do
      let(:apartment_name_paths) do
        [
          ["non-existient", "path"],
          ["Identification", "MarketingName"]
        ]
      end

      it "returns a correct value" do
        value = described_class.call(feed_apartment, apartment_name_paths)

        expect(value).to eq "White House"
      end
    end

    context "when no path can resolve" do
      let(:apartment_name_paths) do
        [
          ["Identification", "non-existient", "path"]
        ]
      end

      it "raises an error" do
        expect {
          described_class.call(feed_apartment, apartment_name_paths)
        }.to raise_error described_class::FailedToResolve
      end
    end
  end
end
