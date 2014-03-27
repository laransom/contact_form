class Contact < ActiveRecord::Base
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :subject, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
