class FixRequestsId < ActiveRecord::Migration
  def change
    remove_column :line_items, :requests_id
    add_column :line_items, :request_id, :integer
  end
end
