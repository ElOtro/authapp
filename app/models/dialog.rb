class Dialog < ActiveRecord::Base
	belongs_to :owner, class_name: "User", foreign_key: "owner_id"
	belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
	has_many :messages, autosave: true, dependent: :destroy
end
