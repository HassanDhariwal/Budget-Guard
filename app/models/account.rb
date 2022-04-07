class Account < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :account_type, presence: true
  has_many :recodes
end
