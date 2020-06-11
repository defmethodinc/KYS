class CreateConfidenceLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :confidence_levels do |t|
      t.integer :member_id
      t.integer :tool_id
      t.integer :confidence_level
      t.timestamps
    end
  end
end
