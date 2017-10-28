class CreateHelpRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :help_requests do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :author, null: false

      t.timestamps null: false
    end

    create_table :help_requests_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :help_request, index: true
    end
  end
end
