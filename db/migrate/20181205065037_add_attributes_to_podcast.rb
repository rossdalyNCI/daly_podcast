class AddAttributesToPodcast < ActiveRecord::Migration[5.1]
  def change
    add_column :podcasts, :title, :string
    add_column :podcasts, :description, :text
    add_column :podcasts, :itunes, :string
    add_column :podcasts, :twitter, :string
    add_column :podcasts, :instagram, :string
  end
end
