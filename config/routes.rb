Rails.application.routes.draw do
  
  root 'missions#index'

  resources :missions do
  	collection do
  		get :search
  		get :missionlist  # creates a route for search
  	end
  end

  resources :carousels


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
