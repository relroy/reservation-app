Rails.application.routes.draw do
  
  


  devise_for :users
  # devise_scope :user do
  #  authenticated :user do
  #    root 'boats#index', as: :authenticated_root
  #  end

  #  unauthenticated do
  #    root 'devise/registrations#new', as: :unauthenticated_root
  #  end
  # end
  

  devise_scope :user do
  end

  # authenticated :user do
  #   root 'links#index', as: :authenticated_root
  # end

  # unauthenticated do
  #   root 'devise/registrations#new', as: :unauthenticated_root
  # end
  
  get '/' => 'boats#index'
  get '/boats' => 'boats#index'
  get '/boats/new' => 'boats#new'
  get '/boats/:id' => 'boats#show'   
  post '/boats' => 'boats#create'
  get '/boats/:id/edit' => 'boats#edit'
  patch '/boats/:id' => 'boats#update'
  delete '/boats/:id' => 'boats#destroy'
















end