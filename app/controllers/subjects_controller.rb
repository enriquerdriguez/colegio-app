class SubjectsController < ApplicationController

  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.all
  end

  def show
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:success] = "Subject saved successfully"
      redirect_to subjects_path
    else
      flash[:danger] = "Subject didnt save"
      render 'new'
    end
  end

  def edit
  end

  def update

  end

  def destroy
    @subject.destroy
    flash[:success] = "Subjected deleted"
    redirect_to subjects_path
  end

  private

    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:name)
    end

end