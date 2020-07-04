Rails.application.routes.draw do
  # devise_for :users
  root "items#index"
  resources :items do
    collection do
      get :purchase
    end
  end

  resources :users do
    collection do
      get :logout
    end
    resources :items do
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
end
