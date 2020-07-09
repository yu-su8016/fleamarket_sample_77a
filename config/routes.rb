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
      get :logout, :like
    end
  end
  resources :items do
    resource :likes, only: [:create, :destroy]
    collection do
      get :search
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
      get :header_category, defaults: { format: 'json' }
    end
    resources :purchases do
      collection do
        get :purchase, :after_purchase
      end
    end
    member do
      get :image_delete
    end
  end
  resources :cards do
    collection do
      get :delete
    end
  end
end

