class RenamePostCountInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :posts_counte, :posts_counter

  end
end
