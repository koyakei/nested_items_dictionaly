Rails.application.routes.draw do
  resources :item_aliases
  resources :tag_items
  resources :item_images
  resources :item_grades_discounts
  resources :costs_for_items
  resources :grades
  resources :item_attributes
  resources :item_additional_conditions
  resources :logistic_order_templates
  resources :yamato_logistic_order_templates
  resources :yamato_handling_type_codes
  resources :yamato_packing_item_codes
  resources :yamato_size_item_codes
  resources :accessories
  resources :items
  resources :additional_conditions
  resources :users
  resources :attributes
  resources :display_units
  resources :tags
  resources :viron_authtype
  resources :swagger
  resources :viron
  get 'hello_page/hello'
  root 'hello_page#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
