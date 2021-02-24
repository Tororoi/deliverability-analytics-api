class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices, id: :uuid do |t|
      t.text :phone_number
      t.text :carrier
      t.timestamp :disabled_at, limit: 6

      t.timestamps
    end
  end
end
