namespace :elasticsearch do
  desc "(Re)Create elasticsearch indexes"
  task reindex: :environment do
    index_name = Item.reindex(async: {wait: true})
    Searchkick.reindex_status(index_name[:index_name])
    Item.search_index.promote(index_name[:index_name])
  end
end