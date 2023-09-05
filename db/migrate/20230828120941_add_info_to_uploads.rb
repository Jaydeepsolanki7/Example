class AddInfoToUploads < ActiveRecord::Migration[7.0]
  def change
    add_column :uploads, :info, :string
  end
end
