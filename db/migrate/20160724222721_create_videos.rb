class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    	t.integer :user_id
		t.string :video
		t.string :title
		t.string :description
		t.timestamps null: false
    end
  end
end
