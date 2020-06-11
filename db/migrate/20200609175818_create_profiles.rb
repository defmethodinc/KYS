class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer :member_id
      t.string :seniority
      t.timestamps
    end
  end
end
