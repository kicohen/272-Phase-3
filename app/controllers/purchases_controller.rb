class PurchasesController < ApplicationController
  layout "admin"

  respond_to :html, :xml, :json

  before_action :set_active

  def index
  	@purchases = Purchase.chronological.paginate(page: params[:page]).per_page(10)
    respond_with @purchases
  end

  def new
  	@purchase = Purchase.new
  end

  def create
  	@purchase = Purchase.new(purchase_params)
    @purchase.date = Date.current
    if @purchase.save
      flash[:notice] = "Successfully added a purchase for #{@purchase.quantity} #{@purchase.item.name}."
      redirect_to purchases_path
    else
      render action: 'new'
    end
  end

private
    # Never trust parameters from the scary internet, only allow the white list through.

    def purchase_params
      params.require(:purchase).permit(:item_id, :quantity, :date)
    end

    def set_active
      @active = 'purchases'
    end

end
