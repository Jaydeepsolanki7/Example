class AddUploaderNameToUpload < ActiveRecord::Migration[7.0]
  def change
    add_column :uploads, :uploaded_by, :string
  end
end
