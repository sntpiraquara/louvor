class AddRepertoryMusicRelation < ActiveRecord::Migration[7.0]
  def change
    create_join_table :repertories, :musics
  end
end
