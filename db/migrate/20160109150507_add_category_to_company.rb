class AddCategoryToCompany < ActiveRecord::Migration
  def change
  	add_column :companies, :category_id, :integer
  	add_index :companies, :category_id
  end
end
