class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer:topic_id
      t.string:title,null:false
      t.timestamps
    end
  end
end
