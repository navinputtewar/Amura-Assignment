Rails.application.routes.draw do
  
  resources :sessions
  
  resources :records do
    collection do
      get :show_repos
      get :show_commits
    end
  end

  get "/auth/:provider/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  root to: 'sessions#new'
end
