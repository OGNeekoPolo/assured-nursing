class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.date :date
      t.integer :jobId
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :license
      t.string :specialty
      t.string :shift
      t.date :startdate
      t.date :enddate
      t.text :description
      t.text :benefits
      t.text :requirements

      t.timestamps
    end
  end
end
