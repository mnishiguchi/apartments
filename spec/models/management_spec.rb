# == Schema Information
#
# Table name: managements
#
#  id          :integer          not null, primary key
#  name        :string
#  email       :string
#  identifier  :string
#  url         :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "rails_helper"

RSpec.describe Management, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
