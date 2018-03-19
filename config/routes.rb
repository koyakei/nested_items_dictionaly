Rails.application.routes.draw do
  namespace :admin do
    resources :standard_units
  end
  namespace :admin do
    resources :maker_aliases
  end
  namespace :admin do
    resources :makers
  end
  namespace :admin do
    resources :yamato_handling_type_codes
  end
  namespace :admin do
    resources :yamato_packing_item_codes
  end
  namespace :admin do
    resources :yamato_size_item_codes
  end
  
  get 'hello_page/hello'
  root 'hello_page#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
