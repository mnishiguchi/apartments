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
  
  # TODO: Refactor
  #
  def build(filter_hash)
    list_1 = [
      build_bedroom_count(filter_hash),
      build_bathroom_count(filter_hash),
      build_rent(filter_hash),
      build_pet(filter_hash)
    ].flatten.compact.join("_")

    [list_1, build_amenities(filter_hash)].compact.join("/")
  end

  private

  def build_bedroom_count(filter_hash)
    return if filter_hash[:bedroom_count].blank?

    case filter_hash[:bedroom_count]
    when 0.5 then "studio"
    when 1.0 then "1-bed"
    when 2.0 then "2-bed"
    when 3.0 then "3-bed"
    when 4.0 then "4-bed"
    when 5.0 then "5-bed"
    else nil
    end
  end

  def build_bathroom_count(filter_hash)
    return if filter_hash[:bathroom_count].blank?

    case filter_hash[:bathroom_count]
    when 1.0 then "1-bath"
    when 2.0 then "2-bath"
    when 3.0 then "3-bath"
    when 4.0 then "4-bath"
    when 5.0 then "5-bath"
    else nil
    end
  end

  def build_rent(filter_hash)
    return if filter_hash[:rent].blank?

    if filter_hash[:rent]
      if filter_hash[:rent][:min] && filter_hash[:rent][:max]
        "#{filter_hash[:rent][:min]}-to-#{filter_hash[:rent][:max]}"
      elsif filter_hash[:rent][:min]
        "over-#{filter_hash[:rent][:min]}"
      elsif filter_hash[:rent][:max]
        "under-#{filter_hash[:rent][:max]}"
      end
    else
      nil
    end
  end

  def build_pet(filter_hash)
    return if filter_hash[:pet].blank?

    case filter_hash[:pet]
    when "dog" then "pet-friendly-dog"
    when "cat" then "pet-friendly-cat"
    when "ok" then "pet-friendly"
    else nil
    end
  end

  def build_amenities(filter_hash)
    return if filter_hash[:amenities].blank?

    filter_hash[:amenities].join('_')
  end
end
