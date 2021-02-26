Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        resources :users
        post '/login', to: 'auth#create'
        get '/profile', to: 'auth#profile'
        resources :order_items
        resources :orders
        resources :reviews
        resources :products
        resources :favorites

    end
  end
end

      # resources :auth, only: %i[create] do
      #   collection do
      #     post 'password/forgot', to: 'auth#forgot_password'
      #     post 'password/reset', to: 'auth#reset_password'
      #     get 'me', to: 'auth#logged_in'
      #     delete 'logout', to: 'auth#logout'
      #   end
      # end