Fabricator('LogisticOrderTemplatable::Yamato::LogisticOrderTemplate') do
  yamato_size_item_code      LogisticOrderTemplate::Yamato::LogisticSize.first!
  yamato_packing_item_code   LogisticOrderTemplate::Yamato::PackingItemCode.first!
  yamato_handling_type_code1 LogisticOrderTemplate::Yamato::HandlingTypeCode.first!
  yamato_handling_type_code2 nil
  creator                    User.first!
end
