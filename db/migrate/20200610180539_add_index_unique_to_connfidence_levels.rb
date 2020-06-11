class AddIndexUniqueToConnfidenceLevels < ActiveRecord::Migration[6.0]
  def change
    add_index(:confidence_levels, [:member_id, :tool_id], unique: true)
  end
end
