class PurchaseOrder < ActiveRecord::Base
  belongs_to :order
  has_many :requests
  has_many :line_items, through: :requests
end
