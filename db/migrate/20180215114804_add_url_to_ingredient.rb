class AddUrlToIngredient < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :url, :string
  end
end
