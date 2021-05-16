Rails.application.routes.draw do
  root 'categories#index'

  resources :categories, only: [:index, :show] do
    collection do
      post :create_category
      post :create_idea
    end
  end
end
