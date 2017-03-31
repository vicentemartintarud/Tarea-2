Rails.application.routes.draw do
  root 'users#index'

  get 'usuario', to:"users#index", :defaults => { :format => :json }
  get 'usuario/:id', to:"users#show", :defaults => { :format => :json }
  post 'usuario/:id', to:"users#update", :defaults => { :format => :json }
  put 'usuario', to:"users#create", :defaults => { :format => :json }
  delete 'usuario/:id', to:"users#destroy", :defaults => { :format => :json }
  #get 'homeworks/:id/studentanswer', to:"homeworks#answers", as: "studentanswer"
  resources :users, :defaults => { :format => :json }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
