class AccountsController < ApplicationController
  
  def index
    # @accounts= Account.all
    # current_user.accounts
    # (simple jo user login ha is ka data show)
     @accounts= current_user.accounts
  end

  def show
    @account = Account.find(params[:id])
    @recodes = @account.recodes
    # =================================


    @credit_amount  = 0
    @debit_amount = 0
    total_amount = 0
    @recodes.each do |recode|
      puts "record_id #{recode.id}"
      puts "amount #{recode.amount}" #tb used kerty hn jb string my rekh vana ho
      total_amount =  total_amount + recode.amount
      if  recode.recode_type == "income"
        @credit_amount  = @credit_amount +  recode.amount

      elsif recode.recode_type == "expence"

        @debit_amount  = @debit_amount + recode.amount
      end

    end
    puts "total_amount #{total_amount}"

    # =================================
    @starting_balacne = @account.amount
    @account_balance = (@starting_balacne + @credit_amount) - @debit_amount
  #  @recodes = @account.recodes account kya data ko recodes main show ker vaya
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



