class TutorialsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if params[:search]
      @tutorials = Tutorial.where('title like ?', "%#{params[:search]}%")
    else
      @tutorials = Tutorial.order(id: :desc)
    end

    @tutorials = @tutorials.paginate(per_page: 6, page: params[:page])
  end

  def show
    @tutorial = Tutorial.friendly.find(params[:id])
    @step_list = @tutorial.steps.order(no: :asc)
    @step = params[:step]

    if @step == params[:step]
      @get_body = @tutorial.steps.where(no: @step)
    end
  end

  def new
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = Tutorial.new(tutorial_params)
    @tutorial.user = current_user

    if @tutorial.save
      redirect_to @tutorial
    else
      render 'new'
    end
  end

  def edit
    @tutorial = Tutorial.friendly.find(params[:id])
    authorize @tutorial
  end

  def update
    @tutorial = Tutorial.friendly.find(params[:id])
    authorize @tutorial

    if @tutorial.update(tutorial_params)
      redirect_to @tutorial
    else
      render 'edit'
    end
  end

  def destroy
    @tutorial = Tutorial.friendly.find(params[:id])
    authorize @tutorial

    @tutorial.destroy
    redirect_to root_path, notice: 'Tutorial berhasil di hapus'
  end

  private

  def tutorial_params
    params.require(:tutorial).permit(:tag_programming_id, :title,
                                    steps_attributes: [:id, :_destroy, :tutorial_id, :no, :title, :body])
  end
end
