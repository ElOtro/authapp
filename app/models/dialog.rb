class Dialog < ActiveRecord::Base
	belongs_to :owner, class_name: "User", foreign_key: "owner_id"
	has_many :messages, autosave: true, dependent: :destroy
end
