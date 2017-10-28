class AddStateToHelpRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :help_requests, :state, :string, null: false, default: 'draft'
  end
end
