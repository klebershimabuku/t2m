class CreateUserChannels < ActiveRecord::Migration
  def change
    create_table :user_channels do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :channel, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end

