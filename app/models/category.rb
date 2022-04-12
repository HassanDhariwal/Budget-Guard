class Category < ApplicationRecord
  has_many :recode
  belongs_to :user


end
