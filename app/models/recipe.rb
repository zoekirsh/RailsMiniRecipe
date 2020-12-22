class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  validates_presence_of :name
  validates :name, uniqueness: true 

  accepts_nested_attributes_for :ingredients 
end
