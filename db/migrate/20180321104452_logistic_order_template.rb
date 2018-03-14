class LogisticOrderTemplate < ActiveRecord::Migration[5.1]
  def change
	  add_reference :logistic_order_templates, :logistic_order_template_type,
	                index: {name: :index_logistic_templates_on_logistic_template_type_id}
  end
end
