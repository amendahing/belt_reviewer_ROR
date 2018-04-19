class User < ApplicationRecord
    has_secure_password
    has_many :attendances
    has_many :events, through: :attendances, source: :event
    has_many :messages

    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :fname, :lname, presence: true, length: { in: 2..20 }
    validates :city, :state, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }


end
