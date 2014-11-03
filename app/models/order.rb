class Order < ActiveRecord::Base
  has_many :purchase_orders
end
