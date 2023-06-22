# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: "Books App DashBoard" do

  para "Welocome to Books App. Read The Books and Get Their Information"
  
  panel 'Book Suggestion For You' do
      ul do
        li do
          book = Book.order('RANDOM()').first
          link_to(book.name, admin_book_path(book))
        end
      end
    end
  end 
end
