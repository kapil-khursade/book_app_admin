class Api::ShelvesController < ApplicationController
  def index
    section_id = params[:section_id]
    render json: Shelf.where(section_id: section_id)
  end
end