class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :allergies, dependent: :destroy
end
