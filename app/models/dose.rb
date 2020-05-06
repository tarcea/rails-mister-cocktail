class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  # validates :cocktail_id, uniqueness: { scope: :ingredient_id }
  # validates :ingredient_id, uniqueness: { scope: :cocktail_id }
  validates :description, presence: true
end
