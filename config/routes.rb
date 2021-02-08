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
    resources :comments, except:[:edit, :update]
    resources :likes, except:[:edit, :update]
    resources :payments, except:[:edit, :update]
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
    resources :profs, only:[:edit, :update]
  end
  get "likes", to: "likes#index"
  get '*path', controller: 'application', action: 'e404'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
