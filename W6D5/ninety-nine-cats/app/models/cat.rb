# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  color       :string           not null
#  sex         :string(1)        not null
#  description :text
#  birth_date  :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    CAT_COLORS = [
        "white"
    ]

    validates :name, :color, :sex, :birth_date, presence: true
    validates :sex, length: { is: 1 }
    validates :sex, inclusion: { in: ["M", "F"] }
    validates :color, inclusion: { in: CAT_COLORS }
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future
        return unless birth_date.present? && birth_date > Date.today

        errors.add(:birth_date, "Birthday cannot be in the future")
    end 

    def age 
        time_ago_in_words(birth_date)
    end 
end
