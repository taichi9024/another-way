Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do
    root 'staffs#new'
    get 'dashboard', to: 'top#index'
    get 'login', to: 'staffs#new'
    post 'session', to: 'staffs#create'
    delete 'logout', to: 'staffs#destroy'

    get 'user', to: 'manage#user'
    get 'payment', to: 'manage#payment'
    get 'space', to: 'manage#space'
    get 'comment', to: 'manage#comment'
    get 'fb', to: 'manage#fb'
  end

  resources :spaces do
    resources :comments, except: %i[edit update]
    resources :likes, except: %i[edit update]
    resources :payments, except: %i[edit update]
    post 'booking', to: 'payments#book_create'
  end

  resources :feedbacks
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    get 'user/:id', to: 'users/registrations#detail'
    get 'signup', to: 'users/registrations#new'
    get 'login', to: 'users/sessions#new'
    delete 'logout', to: 'users/sessions#destroy'
    resources :profs, only: %i[edit update]
  end
  get 'resign', to: 'resign#new'
  post 'goodbye', to: 'resign#create'
  get 'likes', to: 'likes#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
