class ProfessorsController < ApplicationController

  before_action :set_professor, only: [:show, :edit, :update, :destroy]

  def index
    @professors = Professor.paginate(page: params[:page], per_page: 4)
  end

  def show
  end

  def new
    @professor = Professor.new
  end

  def create
    @professor = Professor.new(professor_params)
    if @professor.save
      flash[:success] = "Professor saved successfully"
      redirect_to professor_path(@professor)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @professor.update(professor_params)
      flash[:success] = "Professor updated successfully"
      redirect_to professor_path(@professor)
    else
      render 'edit'
    end
  end

  def destroy
    @professor.destroy
    flash[:danger] = "Professor was successfully deleted"
    redirect_to professors_path
  end

  private
    def professor_params
      params.require(:professor).permit(:first_name, :last_name, :email, :telephone, :picture, :birthdate)
    end

    def set_professor
      @professor = Professor.find(params[:id])
    end
end