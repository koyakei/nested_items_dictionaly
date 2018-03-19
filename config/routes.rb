Rails.application.routes.draw do
  namespace :admin do
    resources :yamato_size_item_codes
  end
  
  get 'hello_page/hello'
  root 'hello_page#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
