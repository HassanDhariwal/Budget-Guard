class RecodesController < ApplicationController
  def index
    @recodes = Recode.all
  end

  def show
    @recode = Recode.find(params[:id])

  end

  def new
    @recode = Recode.new
    @accounts = current_user.accounts
    @categories = current_user.categories
  #  @recode varibel hi used hoga na ky `recodes` form <%= form_with model: @recodes do |form| %>
  end

  def create
    @recode = Recode.new(recode_params)
    # @account.color = "Black"
    if @recode.save
      redirect_to action: "index", controller: "accounts"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @recode = Recode.find(params[:id])
    @accounts = current_user.accounts
    @categories = Category.all

  end
  # binding.pry
  def update
    recode = Recode.find(params[:id])
    if recode.update(recode_params)
      redirect_to action: "index", controller: "accounts"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    recode = Recode.find(params[:id])
    recode.destroy
    #redirect_to action: "index" menes proivide root ab wapis index per chala jay
    redirect_to action: "index", :notice => "Account record deleted"
  end

    # file = File.read('/home/hassan/Downloads/meezan/AccountFullStatement.CSV')
  # exit
  # exit! (exit from looop)

  private
  def recode_params
    params.require(:recode).permit(:category_id, :recode_type, :amount, :date_time, :note, :account_id )
  end
end


