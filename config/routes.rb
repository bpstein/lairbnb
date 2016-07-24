Rails.application.routes.draw do

  root 'pages#home'

  devise_for 	:users, 
  						:path => '', 
  						:path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
  						:controllers => {:omniauth_callbacks => 'users/omniauth_callbacks',
  														 :registrations => 'registrations'
  														}

  devise_scope :user do
  # Had to add routes for callbacks here because otherwise the routes get
  # messed up -- prepending an extra "/my_engine" in one case.
    providers = Regexp.union(Devise.omniauth_providers.map(&:to_s))

    path_prefix = '/users/auth'

    match "#{path_prefix}/:provider",
      :constraints => { :provider => providers },
      :to => "omniauth_callbacks#passthru",
      :as => :user_omniauth_authorize,
      :via => [:get, :post]

    match "#{path_prefix}/:action/callback",
      :constraints => { :action => providers },
      :to => 'omniauth_callbacks',
      :as => :user_omniauth_callback,
      :via => [:get, :post]
  end

  resources :users, only: [:show]
  resources :rooms
  resources :photos

  resources :rooms do
    resources :reservations, only: [:create]
  end

  resources :conversations, only: [:index, :create] do 
    resources :messages, only: [:index, :create]
  end

  resources :rooms do 
    resources :reviews, only: [:create, :destroy]
  end

  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'

  get '/your_trips' => 'reservations#your_trips'
  get '/your_reservations' => 'reservations#your_reservations'

  post '/notify' => 'reservations#notify'
  post '/your_trips' => 'reservations#your_trips'

  get '/search' => 'pages#search'

end
