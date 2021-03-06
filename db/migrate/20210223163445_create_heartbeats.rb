class CreateHeartbeats < ActiveRecord::Migration[6.0]
  def change
    create_table :heartbeats, id: :uuid do |t|
      t.timestamp :created_at, null: false, limit: 6
      t.belongs_to :device, type: :uuid, null: false, foreign_key: true
    end
  end
end
