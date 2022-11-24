class HouseFoodsController < ApplicationController
  def index
    if params[:query].present?
      @foods = policy_scope(HouseFood).search_for_name_and_category(params[:query]).order("expiry_date ASC")
    else
      @foods = policy_scope(HouseFood).order("expiry_date ASC")
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "house_foods/cards", locals: { foods: @foods }, formats: [:html] }
    end
  end

  def show
    @house_food = HouseFood.find(params[:id])
    authorize @house_food
  end

  def new
    @house_food = HouseFood.new
    authorize @house_food
  end

  def create
    # if the create is coming from the shopping list
    # otherwise, the food is submitted in the form
    if params[:food_id].present?
      @house_food = HouseFood.new
      food = Food.find(params[:food_id])
      @house_food.food = food
      @house_food.bought_date = Date.today
      # expiry date hardcoded for now!
      @house_food.expiry_date = Date.today + 7
      @house_food.amount = item
    else
      @house_food = HouseFood.find(house_food_params)
    end
    @house_food.house = current_user.house
    authorize @house_food
    # this is when the food is created from inventory
    if @house_food.save
      redirect_to house_foods_path
    else
      raise
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @house_food = HouseFood.find(params[:id])
    authorize @house_food
    @house_food.destroy
    redirect_to house_foods_path
  end

  def eat
    @house_food = HouseFood.find(params[:id])
    @house_food.amount -= 1
    authorize @house_food
    redirect_to house_food_path(@house_food) if @house_food.save
  end

  private

  def house_food_params
    params.require(:house_food).permit( :food_id, :amount, :photo, :bought_date, :expiry_date)
  end
end
