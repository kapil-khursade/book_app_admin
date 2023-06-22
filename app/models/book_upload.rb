class BookUpload < ApplicationRecord
    mount_uploader :excel_file, ExcelUploader
end
