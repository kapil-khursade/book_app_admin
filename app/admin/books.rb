ActiveAdmin.register Book do

  permit_params :name, :author, :publication_year, :shelf_id

  index do
    column :name
    column :author
    column :publication_year
    column :shelf
    column :section do |book|
     book.shelf.section
    end
    actions
  end

  form do |f|
  f.inputs do
    f.input :name
    f.input :author
    f.input :publication_year
    f.input :section, as: :select, collection: Section.all.map { |section| [section.name, section.id] }, prompt: 'Select a section', input_html: { id: 'book_section_id' }
    f.input :shelf_id, as: :select, collection: [], prompt: 'Select a shelf', input_html: { id: 'book_shelf_id' }
  end
  f.actions
end

end
