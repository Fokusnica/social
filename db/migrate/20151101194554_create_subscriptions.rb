class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :leader, index: true, foreign_key: true
      t.references :follower, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
