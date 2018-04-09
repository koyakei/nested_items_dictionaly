class ReindexConversionsJob < ApplicationJob
  def perform(class_name)
    # get records that have a recent conversion
    recently_converted_ids =
      Searchjoy::Search.where("convertable_type = ? AND converted_at > ?", class_name, 1.day.ago)
        .order(:convertable_id).uniq.pluck(:convertable_id)

    # split into groups
    recently_converted_ids.in_groups_of(1000, false) do |ids|
      # fetch conversions
      conversions =
        Searchjoy::Search.where(convertable_id: ids, convertable_type: class_name)
          .group(:convertable_id, :query).uniq.count(:user_id)

      # group conversions by record
      conversions_by_record = {}
      conversions.each do |(id, query), count|
        (conversions_by_record[id] ||= {})[query] = count
      end

      # write to cache
      conversions_by_record.each do |id, conversions|
        Rails.cache.write("search_conversions:#{class_name}:#{id}", conversions)
      end

      # partial reindex
      class_name.constantize.where(id: ids).reindex(:search_conversions)
    end
  end
end