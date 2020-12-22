class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
    @users = User.all 
    @ingredients = Ingredient.all 
  end

  def create
    @recipe = Recipe.create(name: params[:recipe][:name], user_id: params[:recipe][:user_id])
    recipe_params[:ingredients].each {|i| RecipeIngredient.create(recipe_id: @recipe.id, ingredient_id: i)}
    if @recipe.valid?
      redirect_to @recipe
    else
      flash[:errors] = @recipe.errors.full_messages
      redirect_to new_recipe_path 
    end
  end

  def edit
    @recipe = Recipe.new
    @users = User.all 
    @ingredients = Ingredient.all 
  end

  def update
    @recipe = Recipe.update(recipe_params)
    redirect_to @recipe
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  #custom
  def sort_low_high
    @recipes = Recipe.all.sort_by{|r| r.ingredients.length }
  end

  private

  def set_recipe 
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :user_id, ingredients:[])
  end
end
