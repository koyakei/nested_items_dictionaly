namespace :elasticsearch do
  desc "(Re)Create elasticsearch indexes"
  task reindex: :environment do
    Item.reindex async: {wait: true}
  end
end