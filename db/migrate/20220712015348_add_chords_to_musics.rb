class AddChordsToMusics < ActiveRecord::Migration[7.0]
  def change
    add_column :musics, :chords, :text, null: false, default: ''
  end
end
