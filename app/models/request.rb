class Request < ActiveRecord::Base
  belongs_to :purchase_order
  has_many :line_items
end
