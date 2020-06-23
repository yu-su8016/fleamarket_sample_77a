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
  end
  resources :cards do
  end
end
