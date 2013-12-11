FirstRoutes::Application.routes.draw do
  resources :users do
    resources :contacts, :only => [:index, :create]
  end

  # get 'users' => 'users#index'
  # post 'users' => 'users#create'
  # get 'users/new' => 'users#new'
  # get 'users/:id' => 'users#show'
  # get 'users/:id/edit' => 'users#edit'
  # put 'users/:id' => 'users#update'
  # delete 'users/:id' => 'users#destroy'

  resources :contacts, :only => [ :show, :update, :destroy]

  resources :contact_shares, :only => [:create, :destroy]

end
