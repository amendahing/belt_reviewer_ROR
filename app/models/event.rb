class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances
  has_many :users, through: :attendances, source: :user
  # has_many :users
  has_many :messages

  validates :name, :date, :city, :state, presence: true
  validates_date :date, :on_or_after => lambda { Date.current }
  # validates_date :date, on_or_after: lambda { Date.current }
end
