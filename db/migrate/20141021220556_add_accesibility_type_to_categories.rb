class AddAccesibilityTypeToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :accesibility_type, :string
    add_reference :categories, :place, index: true
  end
end
