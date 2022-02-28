class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :discussion, null: false, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
