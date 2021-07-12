Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :projects, except: [:new, :edit] do
      	resources :images, only: [:create, :destroy]
      end
      resources :testimonials, except: [:new, :edit] do
      	collection do
		      get :students
		      get :clients
		      get :colleagues
		    end
      end
    end
  end
end
