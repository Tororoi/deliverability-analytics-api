class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports, id: :uuid do |t|
      t.text :sender
      t.text :message
      t.belongs_to :device, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
