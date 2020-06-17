Rails.application.routes.draw do
	resources :restaurants do
    	resources :reviews, only: [ :new, :create ]

    	collection do
    		get :top
    	end

    	member do
    		post :feature
    	end
	end
	resources :reviews, only: [ :destroy ]
end
