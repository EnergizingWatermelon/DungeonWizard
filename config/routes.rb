Rails.application.routes.draw do
  resources :maps
  get 'maps' => 'maps#index'

  resources :adventures
  get 'adventures' => 'adventures#index'
  
  resources :encounters
  get 'encounters' => 'encounters#index'
  
  resources :characters
  get 'characters' => 'characters#index'
  
  resources :application
  get 'instructions' => 'adventures#instructions'
  
  resources :application
  get 'about' => 'adventures#about'
  
  resources :application
  get 'contact' => 'adventures#contact'

  root :to => redirect('/adventures')
  
end
