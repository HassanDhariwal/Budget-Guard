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
      total_amount =  total_amount + recode.amount.to_i
      if  recode.recode_type == "income"
        @credit_amount  = @credit_amount +  recode.amount.to_i

      elsif recode.recode_type == "expence"

        @debit_amount  = @debit_amount + recode.amount.to_i
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

  def import
    # file =  File.read('/home/hassan/Downloads/meezan/AccountFullStatement.CSV')
    @accounts = current_user.accounts
    account_id = params[:account_id]


    file = params[:file]
    csv = File.read(file)

    CSV.parse(csv, headers: true).each do |row|
      des = row["Description"]
      category_name = des.split[0..1].join(' ')
      #split used for get two words
      category = Category.where(name: category_name)

      if category.blank?
        Category.create(name: category_name, user_id: current_user.id)
        category = Category.where(name: category_name)
      end
      category_id = category.first.id
      #where
      recode_type = ""
      amount = 0

      if row["Debit"].present?
      recode_type = "expence"
       amount = row["Debit"]
      elsif row["Credit"].present?
        recode_type = "income"
        amount = row["Credit"]
      end

      # row = Recode.new(date_time: row["Transaction"],note: row["Description"], amount: amount, account_id: account_id,recode_type: recode_type )
      Recode.create(date_time: row["Transaction"],note: row["Description"], amount: amount, account_id: account_id,category_id: category_id ,recode_type: recode_type )
      end

    # Record.new(asdfs,sdf, acount_id: account_id)


    redirect_to action: "index", notice: "Products imported."
  end

  private
  def account_params
    params.require(:account).permit(:name, :account_type, :amount, :currency, :user_id).merge("currency": "PKR")
  end
end



