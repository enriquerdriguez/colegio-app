class SubjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :permission?, except: [:index, :show]
  load_and_authorize_resource

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
      render 'new'
    end
  end

  def edit
  end

  def update
    if @subject.update(subject_params)
      flash[:success] = "Subject updated successfully"
      redirect_to subjects_path
    else
      render 'edit'
    end
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

  def permission?
    if !professor_signed_in?
      flash[:danger] = "You are not allowed to perform that action bro"
      redirect_to root_path
    end
  end

end