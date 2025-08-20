# == Schema Information
#
# Table name: professionals
#
#  id         :bigint           not null, primary key
#  name       :string
#  specialty  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Professional < ApplicationRecord
  validates :name, :specialty, presence: true
end
