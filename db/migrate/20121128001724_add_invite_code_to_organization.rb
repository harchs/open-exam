class AddInviteCodeToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :invite_code, :string
  end
end
