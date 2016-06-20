Rails.application.routes.draw do
  resources :maps
  #get 'maps' => 'maps#index'
  root :to => redirect('/maps')
end
