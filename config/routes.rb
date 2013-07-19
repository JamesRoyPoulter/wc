Ga::Application.routes.draw do

  get "enrolments/create"

# ROOT
  root to: 'events#index'

# USERS
  get '/login', to: 'sessions#new'
  resources :sessions, only: [:create, :destroy]
  resources :users
  get 'events/:id/enrol', to: "events#enrol", as: 'enrol'
  get 'account', to: 'users#account', as: 'account'
  get 'far_koff', to: 'sessions#destroy'

# EVENTS
get 'my_events', to: 'events#my_events', as: 'my_events'
get 'new_booking/:id', to: 'events#clone', as: 'new_booking'
get 'events/:id/bookings', to: 'events#bookings', as: 'bookings'
resources :events do
    collection do
      match 'search', to: 'events#search', via: [:get, :post], as: :search
    end
    # get 'page/:page', action: :index, on: :collection
  end
end








