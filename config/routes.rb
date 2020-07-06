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
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :cards do
  end
end
