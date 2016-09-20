Rails.application.routes.draw do
	devise_for :users

	root to: "static_pages#home"

	get "/alt" => 'static_pages#alt'

	resources :users  
	resources :artworks
	resources :venues
	resources :conversations do
		resources :messages
	end
	
	get "artworks" => 'artworks#index'
	get "venues" => 'venues#index'

end
