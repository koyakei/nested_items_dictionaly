Rails.application.routes.draw do
  resources :yamato_logistic_order_templates
  resources :yamato_handling_type_codes
  resources :yamato_packing_item_codes
  resources :yamato_size_item_codes
  resources :swagger
  resources :googlesignin
  resources :googleoauth
  namespace :admin do
    resources :item_feature_data
    resources :item_images
    resources :item_grades_discounts
    resources :item_attribute_types
    resources :items
    resources :item_aliases
    resources :item_additional_conditions
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
    resources :tag_items
    resources :grades
    resources :makers
    resources :maker_aliases
    resources :standard_units
    resources :logistic_order_templates
  end
  # get 'hello_page/hello'
  root 'hello_page#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
