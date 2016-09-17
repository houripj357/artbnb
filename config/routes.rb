Rails.application.routes.draw do
	devise_for :users

	root "static_pages#home"

	get "/alt" => 'static_pages#alt'

	resources :users
	resources :artworks
	resources :venues

end
