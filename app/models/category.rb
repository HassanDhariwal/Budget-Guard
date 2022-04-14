class Category < ApplicationRecord
  has_many :recodes
  belongs_to :user


end
