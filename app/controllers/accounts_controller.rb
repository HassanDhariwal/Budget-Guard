class AccountsController < ApplicationController
  
  def index
    @accounts= Account.all
  end

  def show
    @accounts = Account.find(params[:id])
  end

  def new
    @accounts = Account.new
    # @accounts = Account.new(type:params[:type], currenty:)accounts
  end

  def create
    @accounts = Account.new(account_params)

    if @accounts.save
      redirect_to action: "index"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
      @accounts = Account.find(params[:id])
  end

  def update
      @accounts = Account.find(params[:id])
      if @accounts.update(account_params)
        redirect_to action: "index"
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @accounts = Account.find(params[:id])
    @accounts.destroy
    #redirect_to action: "index" menes proivide root ab wapis index per chala jay
    redirect_to action: "index", :notice => "Account record deleted"
  end


  private
    def account_params
      params.require(:account).permit(:name, :account_type, :amount, :currency )
    end
  end



