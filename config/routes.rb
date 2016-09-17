Rails.application.routes.draw do
	devise_for :users

	root "static_pages#home"

	get "/alt" => 'static_pages#alt'

	get "about" => 'static_pages#about', as: :about
	get "contact" => 'static_pages#contact', as: :contact

	get "artists" => 'users#index'
	get "/artist/:id", to: 'users#show'

	resources :artworks

end
