class AccountsController < ApplicationController
  
  def index
    # @accounts= Account.all
    # current_user.accounts
    # (simple jo user login ha is ka data show)
     @accounts= current_user.accounts
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    # @account.color = "Black"

    if @account.save
      redirect_to action: "index"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
      @account = Account.find(params[:id])
  end
    # binding.pry
  def update
      account = Account.find(params[:id])
      if account.update(account_params)
        redirect_to action: "index"
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    account = Account.find(params[:id])
    account.destroy
    #redirect_to action: "index" menes proivide root ab wapis index per chala jay
    redirect_to action: "index", :notice => "Account record deleted"
  end


  private
    def account_params
      params.require(:account).permit(:name, :account_type, :amount, :currency, :user_id)
    end
  end



