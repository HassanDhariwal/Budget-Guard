class Account < ApplicationRecord
  validates :name, presence: true
  validates :account_type, presence: true

end
