class AddPhotoToCourts < ActiveRecord::Migration[7.1]
  def change
    add_column :courts, :photo, :binary
  end
end
