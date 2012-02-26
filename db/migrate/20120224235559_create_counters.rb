class CreateCounters < ActiveRecord::Migration
  def change
    create_table :counters do |t|
      t.integer :goal
      t.integer :foul

      t.timestamps
    end
  end
end
