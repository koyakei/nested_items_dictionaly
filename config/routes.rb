Rails.application.routes.draw do
  resources :item_feature_data
  resources :item_aliases
  resources :tag_items
  resources :item_images
  resources :item_grades_discounts
  resources :grades
  resources :item_attribute_types
  resources :item_additional_conditions
  resources :logistic_order_templates
  resources :yamato_logistic_order_templates
  resources :yamato_handling_type_codes
  resources :yamato_packing_item_codes
  resources :yamato_size_item_codes
  resources :items
  resources :swagger
  resources :googlesignin
  resources :googleoauth
  namespace :admin do
    resources :signin
    resources :tags
    resources :accessories
    resources :display_units
    resources :users
    resources :attribute_types
    resources :additional_conditions
    resources :costs_for_items
    resources :tag_order_types
    resources :tag_orders
  end
  # get 'hello_page/hello'
  root 'hello_page#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
