class CreateJoinTableCarCity < ActiveRecord::Migration[5.0]
  def change
    create_join_table :cars, :cities
  end
end
