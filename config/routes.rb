Rails.application.routes.draw do
  root 'users#index'

  get 'users', to:"users#index", :defaults => { :format => :json }
  get 'users/:id', to:"users#show", :defaults => { :format => :json }
  post 'users/:id', to:"users#update", :defaults => { :format => :json }
  put 'users?usuario=vmartin&nombre=Vicente&apellido=&twitter=', to:"users#create", :defaults => { :format => :json }
  delete 'users/:id', to:"users#destroy", :defaults => { :format => :json }
  #get 'homeworks/:id/studentanswer', to:"homeworks#answers", as: "studentanswer"
  resources :users, :defaults => { :format => :json }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
