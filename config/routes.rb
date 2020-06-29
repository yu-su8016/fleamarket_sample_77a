Rails.application.routes.draw do
  root "items#index"
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    # :sessions => 'users/sessions'   
  } 
   
  
  # resources :items do
  #   collection do
  #     get :purchase
  #   end
  # end

  resources :users do
    collection do
      get :logout
      
    end
    resources :items do
      collection do
        get :purchase
      end
    end
  end
  resources :cards do
  end
end
