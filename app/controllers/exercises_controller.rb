class ExercisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercise, except: [:index, :new, :create ]


  def index
    @exercises = current_user.exercises.paginate(:page => params[:page], :per_page => 10)
    @friends = current_user.friends
  end

  def new
    @exercise = current_user.exercises.new
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)
    if @exercise.save
      flash[:success] = "Exercise has been created"
      redirect_to user_exercises_path
    else
      flash[:danger] = "Exercise has not been created"
      render :new
    end
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      flash[:success] = "Exercise has been updated"
      redirect_to [current_user, @exercise]
    else
      flash[:danger] = "Exercise has not been updated"
      render :edit
    end
  end

  def show
  end

  def destroy
    if @exercise.destroy
      flash[:success] = "Exercise has been deleted"
      redirect_to user_exercises_path(current_user)
    else
      flash[:danger] = "Could not delete exercise"
      redirect_to [current_user, @exercise]
    end
  end

#  def complete
#    @exercise.update_attribute(:completed_at, Time.now)
#      redirect_to user_exercises_path(current_user)
#  end

  private
    def exercise_params
      params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
    end


    def set_exercise
      @exercise = current_user.exercises.find(params[:id])
    end
  end
