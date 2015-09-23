class AddTimestampsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :timestamps, :string
  end
end
