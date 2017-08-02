Rails.application.routes.draw do
  # namespace :api, :defaults => { :format => :json } do
  #   namespace :v1 do
  #     resources :trains, :only => [:index, :show]
  #     resources :reservations, :ony => [:show, :create, :update, :destroy]
  #   end
  # end
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      get "/trains" => "trains#index", :as => :trains
      get "/trains/:train_number" => "trains#show", :as => :train

      get "/reservations/:booking_code" => "reservations#show", :as => :reservation
      post "/reservations" => "reservations#create", :as => :create_reservations
      patch "/reservations/:booking_code" => "reservations#update", :as => :update_reservation
      delete "/reservations/:booking_code" => "reservations#destroy", :as => :cancel_reservation

      post "/signup" => "auth#signup"
      post "/login" => "auth#login"
      post "/logout" => "auth#logout"

      get "/me" => "users#show", :as => :user
      patch "/me" => "users#update", :as => :update_user 
    end
  end
end
