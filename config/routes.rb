require 'sidekiq/web'
Rails.application.routes.draw do
  resources :swagger
  resources :googlesignin
  resources :googleoauth
  get 'hello_page/hello'
  namespace :admin do
    mount Sidekiq::Web => 'sidekiq'
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
    namespace :logistic_order_templatable do
      namespace :yamato do
        resources :logistic_order_templates
        namespace :elements do
          resources :handling_type_codes
          resources :yamato_packing_item_codes
          resources :yamato_size_item_codes
        end
      end
    end
  end
  # get 'hello_page/hello'
  root 'hello_page#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
