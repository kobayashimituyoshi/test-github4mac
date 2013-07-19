class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.integer:thread_number
      t.string:name
      t.string:body
      t.string:cook
      t.timestamps
    end
  end
end
