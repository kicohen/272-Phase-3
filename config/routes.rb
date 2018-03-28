Rails.application.routes.draw do

  get 'home/home'

  get 'home/about'

  get 'home/contact'

  get 'home/privacy'

  get 'home/dashboard'

  get 'home/store'

  get 'purchases/index'

  get 'purchases/new'

  get 'purchases/create'

  get 'items/index'

  get 'items/show'

  get 'items/edit'

  get 'items/new'

  get 'items/create'

  get 'items/update'

  get 'items/destroy'

  get 'item_prices/index'

  get 'item_prices/new'

  get 'item_prices/create'

  # Routes for main resources
  resources :items
  resources :purchases
  resources :item_prices

  # Semi-static page routes
  get 'home' => 'home#home', as: :home
  get 'about' => 'home#about', as: :about
  get 'store' => 'home#store', as: :store
  get 'contact' => 'home#contact', as: :contact
  get 'privacy' => 'home#privacy', as: :privacy
  get 'dashboard' => 'home#dashboard', as: :dashboard
  
  # Set the root url
  root :to => 'home#home'  
end
