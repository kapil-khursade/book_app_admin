require 'creek'

ActiveAdmin.register BookUpload do
  permit_params :excel_file


  index do
    column "Excel File Path", :excel_file do |book_upload|
      book_upload.excel_file
    end
    column :id
    actions
  end

   member_action :process_upload, method: :post do

    file = resource.excel_file.path

    creek = Creek::Book.new(file)
    sheet = creek.sheets[0] 

    sheet.rows.drop(1).each do |row|
      columns = row.values
      name = columns[0]
      author = columns[1]
      publication_year = columns[2]

      book_data = {
        name: name,
        author: author,
        publication_year: publication_year,
        shelf_id: 2
      }
      
      Book.create(book_data)
    end

    redirect_to admin_books_path, notice: 'Books imported successfully.'
  end

  show do
    attributes_table do
      row :id
      row :excel_file do
        link_to 'Download', resource.excel_file.url
      end
    end

    panel 'Actions' do
      if resource.excel_file.present?
        link_to 'Process Upload', process_upload_admin_book_upload_path(resource), method: :post
      else
        span 'No file uploaded yet.'
      end
    end
  end

  form do |f|
    f.inputs 'Book Upload' do
      f.input :excel_file, as: :file
    end
    f.actions do
      f.action :submit, label: 'Upload and Process'
    end
  end
end