Rails.application.routes.draw do

  get 'species/show'

  get 'species/index'

  get 'planets/index'

  get 'starships/index'

  get 'characters/index'
  
  resources :planets do
    get 'planets/:id'=> 'planets#show'
  end
  
  resources :starships do
    get 'starships/:id'=> 'starships#show'
  end
  
  resources :films do
    get 'films/:id'=> 'films#show'
  end
  
  resources :characters do
    get 'characters/:id'=> 'characters#show'
  end

  get 'films/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'films#index'

end
