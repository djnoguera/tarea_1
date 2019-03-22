Rails.application.routes.draw do
  get 'films/show'

  get 'films/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'films#index'

end
