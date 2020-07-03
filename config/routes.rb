Rails.application.routes.draw do
  root "items#index"
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  } 
   
  devise_scope :user do
    get 'users/confirmation' => 'users/registrations#confirmation'
  end

  resources :users do
    collection do
      get :logout
    end
  end

  resources :items do
    collection do
      get :purchase
    end
  end

  resources :cards do
  end
end
