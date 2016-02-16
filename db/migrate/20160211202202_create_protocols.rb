class CreateProtocols < ActiveRecord::Migration
  def change
    create_table :protocols do |t|
      t.string :customer_login
      t.references :channel, index: true, foreign_key: true
      t.string :conversation_id
      t.string :phone
      t.string :status
      t.datetime :in_progress_at
      t.datetime :finalized_at

      t.timestamps null: false
    end
  end
end
