module LogisticOrderTemplatable
  extend ActiveSupport::Concern
  included do
    has_one :logistic_order_template, as: :logistic_order_templatable
  end

  def get_size
    raise NotImplementedError
  end
end
