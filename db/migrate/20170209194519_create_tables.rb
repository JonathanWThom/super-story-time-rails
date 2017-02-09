class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.column :name, :string

      t.timestamps
    end

    create_table :contributions do |t|
      t.column :content, :string
      t.column :image, :string
      t.column :user_id, :integer
      t.column :story_id, :integer
    end

    create_table :stories do |t|
      t.column :title, :string
    end
  end
end
