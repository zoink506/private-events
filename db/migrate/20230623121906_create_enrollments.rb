class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.integer "user_id"
      t.integer "event_id"
      t.index ["event_id"], name: "index_enrollments_on_event_id"
      t.index ["user_id"], name: "index_enrollments_on_user_id"

      t.timestamps
    end
  end
end
