class AddLinkToInteraction < ActiveRecord::Migration
  def change
    add_column :interactions, :link, :string
  end
end
