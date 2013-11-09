class CreateTagPros < ActiveRecord::Migration
  def change
    create_table :tag_pros do |t|
      t.string :name

      t.timestamps
    end
  end
end
