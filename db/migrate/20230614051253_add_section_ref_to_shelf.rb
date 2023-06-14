class AddSectionRefToShelf < ActiveRecord::Migration[6.1]
  def change
    add_reference :shelves, :section, foreign_key: true
  end
end
