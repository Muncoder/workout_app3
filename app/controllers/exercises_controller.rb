class ExercisesController < ApplicationController
  before_filter :find_exercise, except: [:index, :create, :new]

  def index
    @exercises = Exercise.all.order("created_at DESC")
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      flash[:success] = "Saved successfully"
      redirect_to exercises_path
    else
      flash[:success] = "Error ! could not saved"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      flash[:success] = "Update successfully"
      redirect_to exercises_path
    else
      flash[:success] = "Error ! could not update"
      render "edit"
    end
  end

  def destroy
    if @exercise.delete
      flash[:success] = "Deleted successfully"
      redirect_to exercises_path
    else
      flash[:success] = "Error ! could not deleted"
      render_to :back
    end
  end

  private

    def exercise_params
      params.require(:exercise).permit(:duration_in_min, :workout, :workout_date)
    end

    def find_exercise
      @exercise = Exercise.find(params[:id])
    end

end