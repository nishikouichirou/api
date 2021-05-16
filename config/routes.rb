Rails.application.routes.draw do
  
  root 'categories#index'
  
  resources :categories, only: [:index,:show] do
    collection do
      post :create_category
      post :create_idea
    end
  end
  
  # resources :ideas, only: [:index] do
  #   collection do
  #     post :create_idea
  #   end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
