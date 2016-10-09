Rails.application.routes.draw do
  get 'news/index'

	devise_for :users

	root to: "static_pages#home"

	get "/alt" => 'static_pages#alt'

	resources :users  
	resources :artworks do 
		resource :like, module: :artworks
	end
	resources :venues
	resources :conversations do
		resources :messages

		collection do 
			get :inbox
			get :all, action: :index
			get :sent 
			get :trash 
		end
	end
	resources :friendships

	# match 'auth/:provider/callback', to: 'sessions#create'
	
	get "artworks" => 'artworks#index'
	get "venues" => 'venues#index'

	get "my_friends", to: 'users#my_friends'
	get 'search_friends', to: "users#search"
	post 'add_friend', to: "users#add_friend" 

	get "thanks", to: "users#thanks"
	get "stripe", to: "users#stripe"

	get "news", to: 'news#index'

end
