Ga::Application.routes.draw do

  get "enrolments/create"

# ROOT
  root to: 'home#home'

# USERS
  get '/login', to: 'sessions#new'
  resources :sessions, only: [:create, :destroy]
  resources :users
  get 'events/:id/enrol', to: "events#enrol", as: 'enrol'
  # get "users/index"
  # get "users/new"
  # get "users/create"

# EVENTS
get 'my_events', to: 'events#my_events', as: 'my_events'
resources :events do
    collection do
      match 'search', to: 'events#search', via: [:get, :post], as: :search
    end
    # get 'page/:page', action: :index, on: :collection
  end
end








