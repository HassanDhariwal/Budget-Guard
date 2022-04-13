class CategoriesController < ApplicationController

  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
    # binding.pry
  end

  def create
    # binding.pry
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
      # binding.pry
    end
  end
  def edit
    @category = Category.find(params[:id])
    @accounts = current_user.accounts
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      redirect_to action: "index", controller: "categories"
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    category = Category.find(params[:id])
    category.destroy
    #redirect_to action: "index" menes proivide root ab wapis index per chala jay
    redirect_to action: "index", :notice => "Account record deleted"
  end

  private
  def category_params
    params.require(:category).permit(:name, :user_id)
  end
end
