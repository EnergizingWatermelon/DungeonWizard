Rails.application.routes.draw do
  resources :maps
  get 'maps' => 'maps#index'

  resources :adventures
  get 'adventures' => 'adventures#index'
  
  resources :encounters
  get 'encounters' => 'encounters#index'

  root :to => redirect('/adventures')
  
end
