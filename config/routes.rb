Rails.application.routes.draw do
	root to: 'posts#index'

	get 'users/index'

	resources :posts do
		resources :likes
	end

	resources :comments
	resources :profiles
	resources :requests

	devise_for :users
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
