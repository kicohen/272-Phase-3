class ItemPricesController < ApplicationController
  layout "admin"
  
  respond_to :html, :xml, :json

  before_action :set_active

  def index
    @active_items = Item.active
    @inactive_items = Item.inactive
  end

  def new
  	@item_price = ItemPrice.new
  end

  def create
  	@item_price = ItemPrice.new(item_price_params)
    if @item_price.save
      flash[:notice] = "Changed the price of #{@item_price.item.name}."
      @item = @item_price.item
      redirect_to item_path(@item)
    else
      render action: 'new'
    end
  end

	private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def item_price_params
      params.require(:item_price).permit(:item_id, :start_date, :end_date, :price)
    end

    def set_active
      @active = 'prices'
    end

end
