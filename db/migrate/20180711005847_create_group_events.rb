class CreateGroupEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :group_events do |t|
      t.string :name, default: '', null: false
      t.text :description, default: ''
      t.integer :number_days, default: 0
      t.integer :duration, default: 0
      t.string :location, default: ''
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :published, default: false, null: false
    end
  end
end
