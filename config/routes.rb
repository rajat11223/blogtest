Rails.application.routes.draw do
  resources :likes
  post "/likepost"=> "likes#like"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
  	resources :comments
  end

  resources :users do 
 post 'process_login', :on => :collection 
  get "/edit"=> "userdetails#edit", :as => "edit" 
 
  
 end
  get "register" => "users#new", :as => "sign_up"
 get "logout" => "users#logout", :as => "logout"

  root 'posts#index'
end
