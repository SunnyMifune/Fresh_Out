class AddAmountToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :amount, :integer
  end
end
