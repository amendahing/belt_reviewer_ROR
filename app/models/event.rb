class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances, source: :user, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, :date, :city, :state, presence: true
  validates_date :date, :on_or_after => lambda { Date.current }
  # validates_date :date, on_or_after: lambda { Date.current }
end
