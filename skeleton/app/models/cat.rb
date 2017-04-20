# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer          not null
#

require 'action_view'

class Cat < ActiveRecord::Base
  include ActionView::Helpers::DateHelper

  CAT_COLORS = %w(black white orange brown)

  has_many(
    :rental_requests,
    class_name: "CatRentalRequest",
    dependent: :destroy
  )

  validates(
    :birth_date,
    :color,
    :name,
    :sex,
    presence: true
  )

  belongs_to :owner,
    primary_key: :id,
    class_name: :User,
    foreign_key: :user_id

  validates :color, inclusion: CAT_COLORS
  validates :user_id, presence: true
  validates :sex, inclusion: %w(M F)

  def age
    time_ago_in_words(birth_date)
  end
end
