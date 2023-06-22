class CreateBookUploads < ActiveRecord::Migration[6.1]
  def change
    create_table :book_uploads do |t|
      t.string :excel_file

      t.timestamps
    end
  end
end
