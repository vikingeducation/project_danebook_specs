Rails.application.routes.draw do
  
  # Set the root URL to the user new page so users can sign up
  # or create an account.
  root 'users#new'
  
  resources :users do
  	# Nest profile under users. There's only one profile 
  	# associated with an individual user (and no need for an index page)
  	# so this will be a singular resource.
  	resource :profile
  end

  resource :session, :only => [:create, :destroy]


  # These are going to go eventually but will stay for now.
  # TODO: Delete these puppies.
  get 'static_pages' => 'static_pages#index'
  get 'static_pages/:page' => 'static_pages#index'
end
