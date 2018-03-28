module ItemPricesHelper

	def get_item_options
		Item.active.alphabetical.map{|i| ["#{i.name}", i.id] }
	end

end
