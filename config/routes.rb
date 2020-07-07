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
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
      get :header_category, defaults: { format: 'json' }
    end
    resources :purchases do
      collection do
        get :purchase, :after_purchase
      end
    end
  end
  resources :cards do
    collection do
      get :delete
    end
  end
end
