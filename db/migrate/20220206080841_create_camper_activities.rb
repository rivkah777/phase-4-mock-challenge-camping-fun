class CreateCamperActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :camper_activities do |t|
      t.references :activity
      t.references :camper
      t.timestamps
    end
  end
end
