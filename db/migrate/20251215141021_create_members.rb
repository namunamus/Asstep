class CreateMembers < ActiveRecord::Migration[7.2]
  def change
    create_table :members do |t|
      t.string :namae
      t.string :daigakumei
      t.text :zikointro

      t.timestamps
    end
  end
end
