class MealsController < ApplicationController
  before_action :get_meal if params.include(:id)
  def index
    @meals = Meal.all
  end

  def show
    @meal
  end

  def edit
    @meal
  end

  def update
    @meal
    if @meal.update(meal_params)
      flash[:success] = "Success"
      redirect_to @meal # TODO Pop_up modal forms
    end
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      flash[:success] = "Meal successfully created"
      redirect_to @meal
    else
      render 'new' # TODO Pop_up modal forms
    end
  end

  def destroy
    @meal.destroy
    flash[:success] = "Meal successfully deleted"
    redirect_to request.referer || root_path
  end

  private

  def meal_params
    params.require(:meal).permit(:weigh, :standard_portion_modifier, { products_id: [] })
  end

  def get_meal
    @meal = Meal.find(params[:id])
  end
end
