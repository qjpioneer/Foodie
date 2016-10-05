class Store < ApplicationRecord
	belongs_to :user

	#paperclip
	has_attached_file :img, styles: { medium: "400x600#"}, default_url: "/images/missing.jpg"
	validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
end
