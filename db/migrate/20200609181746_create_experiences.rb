class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.integer :member_id
      t.integer :tool_id
      t.integer :client_id
      t.integer :experience_in_days
      t.timestamps
    end
  end
end
