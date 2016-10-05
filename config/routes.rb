Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :stores do
  	resources :reviews, except: [:show, :index]
  	#route 在store/review
  end
  root 'stores#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
