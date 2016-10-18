class Store < ApplicationRecord
	searchkick settings: {index: {max_result_window: 100000}}

	belongs_to :user
	has_many :reviews

	#paperclip
	has_attached_file :img, styles: { medium: "600x400#"}, default_url: ":style/F600.jpg"
	#has_attached_file :img, styles: { medium: "600x400#"}, default_url: ":style/logo.png"
	
	validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/

	
end
