class ItemsController < ApplicationController
  layout "admin"

  respond_to :html, :xml, :json

  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_active

  def index
    @boards = Item.for_category("boards").active
    @pieces = Item.for_category("pieces").active
    @clocks = Item.for_category("clocks").active
    @supplies = Item.for_category("supplies").active
    @inactive_items = Item.inactive
    @items = Item.active.alphabetical
    respond_with @items
  end

  def show
    @price_history = @item.item_prices.chronological.last(10).to_a
    @similar_items = Item.for_category(@item.category).active - [@item]
  end

  def edit
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item, notice: "Successfully created #{@item.name}."
    else
      render action: 'new'
    end
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to @item, notice: "Successfully updated #{@item.name}."
    else
      render action: 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: "Successfully removed #{@item.name} from the system."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end
  def set_active
    @active = 'items'
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:name, :description, :color, :category, :weight, :inventory_level, :reorder_level, :active)
  end
end
