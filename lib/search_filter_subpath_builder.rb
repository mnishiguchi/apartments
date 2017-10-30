# Supported search filter subpaths:
#
#   studio
#   1-bed
#   1-bed_pet-friendly
#   1-bed_1-bath_pet-friendly
#   over-700
#   under-1500
#   700-to-1500
#   700-to-1500_pet-friendly-dog
#   700-to-1500_pet-friendly-cat
#   700-to-1500_pet-friendly
#   over-500_pet-friendly-dog/dishwasher_parking
#   700-to-1500_pet-friendly/air-conditioning_washer-dryer_dishwasher_parking_fitness-center_\
#   wheelchair-accessible_pool_furnished_elevator_washer-dryer-hookup_laundry-facilities
class SearchFilterSubpathBuilder
  BEDROOM_COUNT_SLUG = {
    0.5 => "studio",
    1.0 => "1-bed",
    2.0 => "2-bed",
    3.0 => "3-bed",
    4.0 => "4-bed",
    5.0 => "5-bed"
  }.freeze

  BATHROOM_COUNT_SLUG = {
    1.0 => "1-bath",
    2.0 => "2-bath",
    3.0 => "3-bath",
    4.0 => "4-bath",
    5.0 => "5-bath"
  }.freeze

  PET_SLUG = {
    "dog" => "pet-friendly-dog",
    "cat" => "pet-friendly-cat",
    "ok"  => "pet-friendly"
  }.freeze

  def build(filter_hash)
    primary_filter_segment = [
      build_bedroom_count(filter_hash),
      build_bathroom_count(filter_hash),
      build_rent(filter_hash),
      build_pet(filter_hash)
    ].flatten.compact.join("_").presence
    amenities_segment = build_amenities(filter_hash)

    [primary_filter_segment, amenities_segment].compact.join("/")
  end

  private

  def build_bedroom_count(filter_hash)
    BEDROOM_COUNT_SLUG[filter_hash[:bedroom_count].presence]
  end

  def build_bathroom_count(filter_hash)
    BATHROOM_COUNT_SLUG[filter_hash[:bathroom_count].presence]
  end

  def build_rent(filter_hash)
    min = filter_hash.dig(:rent, :min)
    max = filter_hash.dig(:rent, :max)

    return "#{min}-to-#{max}" if min && max
    return "over-#{min}" if min
    return "under-#{max}" if max
  end

  def build_pet(filter_hash)
    PET_SLUG[filter_hash[:pet].presence]
  end

  def build_amenities(filter_hash)
    filter_hash[:amenities].presence&.join("_")
  end
end
