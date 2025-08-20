# == Schema Information
#
# Table name: appointments
#
#  id              :bigint           not null, primary key
#  start_time      :datetime         not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  professional_id :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_appointments_on_professional_id  (professional_id)
#  index_appointments_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (professional_id => professionals.id)
#  fk_rails_...  (user_id => users.id)
#
class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :professional
  validates :start_time, presence: true
end
