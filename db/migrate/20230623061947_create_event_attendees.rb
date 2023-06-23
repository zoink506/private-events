class CreateEventAttendees < ActiveRecord::Migration[7.0]
  def change
    create_table :event_attendees do |t|
      t.references :attended_event, foreign_key: true
      t.references :attendee, foreign_key: true

      t.timestamps
    end
  end
end
