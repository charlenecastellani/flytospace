Rails.application.routes.draw do
  devise_for :users

  root to: 'voyages#index'
  resources :voyages, except: [:index] do
    collection do 
      get :dashboard
    end
    resources :reservations, only: [:new, :create, :destroy] do
      collection do
      get :mes_reservations
      end
    end
  end
    
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 
end
