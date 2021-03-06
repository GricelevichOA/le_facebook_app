class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|

    	t.references :user, foreign_key: true
    	t.text :about_me
    	t.string :location
    	t.date :birthday

    	t.timestamps
    end
  end
end
