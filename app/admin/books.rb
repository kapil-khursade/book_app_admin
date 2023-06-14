ActiveAdmin.register Book do

  permit_params :name, :author, :publication_year, :shelf_id
  
end
