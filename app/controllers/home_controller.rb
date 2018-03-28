class HomeController < ApplicationController
  def home
  	@items_to_reorder = Item.need_reorder
  end

  def about
    redirect_to home_path(anchor: 'about')
  end

  def store
    redirect_to home_path(anchor: 'store')
  end

  def contact
    redirect_to home_path(anchor: 'contact')
  end

  def privacy
    redirect_to home_path(anchor: 'privacy')
  end

  def dashboard
    @active = 'dashboard'
    @items_to_reorder = Item.need_reorder
  	render :layout => 'admin'
  end
end
