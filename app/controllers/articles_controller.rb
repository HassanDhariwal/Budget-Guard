class ArticlesController < ApplicationController
  
  def index
    @account = Account.new

  end
  
  def about
  
  end

  def new
    @account = Account.new
  end



  def import
  # render "articles/about"
  end

end

