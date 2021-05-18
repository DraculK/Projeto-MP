class AddCreatorToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :creator, :boolean
  end
end
