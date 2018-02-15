class ChangeUrlTypeInIngredients < ActiveRecord::Migration[5.1]
  def change
    change_column :ingredients, :url, :text
  end
end
