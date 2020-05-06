class AddStepsToCocktail < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :steps, :text, array: true, default: []
  end
end
