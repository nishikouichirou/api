Rails.application.routes.draw do
  root 'categories#index'

  resources :categories, only: [:index, :show] do
    collection do
      post :create_category
      post :create_idea
    end
  end

  namespace :api, path: '/api' do
    get '/idea_list', to: 'categories#idea_list'
    post '/create_idea', to: 'categories#create_idea'
  end
end
