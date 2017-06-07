Rails.application.routes.draw do
  devise_for :users

  namespace :admin, defaults: { format: :json } do
  	resources :articles
  end

  namespace :api, defaults: { format: :json } do
  	namespace :v1 do
  		resources :article
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
