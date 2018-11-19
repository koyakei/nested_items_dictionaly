Fabricator(:item) do
  name                      "name test"
  parent_item               nil
  max_threshold_price       nil
  min_threshold_price       nil
  description               "description"
  prospected_price          100
  has_child                 false
  is_visible                false
  is_sync_novasto           false
  creator User.first
  maker                     nil
  maker_model_number_full   "MyText"
  maker_model_number        "MyText"
  asin "B078WPGJW7"
  isbn13 "978-4047293564"
  amazon_category_id        nil
  ean                       "MyTextaaaaa"
  url                       "http://makxas.com"
  automatic_assessment_type 1
end
