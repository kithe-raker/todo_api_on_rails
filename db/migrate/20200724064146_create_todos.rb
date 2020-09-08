class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :desc
      t.boolean :isFinish
      t.timestamp :when

      t.timestamps
    end
  end
end
