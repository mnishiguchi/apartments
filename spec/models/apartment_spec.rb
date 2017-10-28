# == Schema Information
#
# Table name: apartments
#
#  id            :integer          not null, primary key
#  name          :string
#  email         :string
#  description   :text
#  url           :string
#  phone         :string
#  office_hours  :jsonb
#  management_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require "rails_helper"

RSpec.describe Apartment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
