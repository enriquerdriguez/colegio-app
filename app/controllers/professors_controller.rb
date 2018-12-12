class ProfessorsController < ApplicationController

  def index
    @professors = Professor.paginate(page: params[:page], per_page: 4)
  end

  def show
    @professor = Professor.find(params[:id])
  end
end