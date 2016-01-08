class CreateDialogs < ActiveRecord::Migration
  def change
    create_table :dialogs do |t|
    	t.integer    :owner_id, index: true
    	t.integer    :recipient_id, index: true
    	t.string     :subject
      t.timestamps null: false
    end
  end
end
