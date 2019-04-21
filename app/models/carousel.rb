class Carousel < ApplicationRecord
	has_attached_file :banner, styles: {large: "1920x800>", medium: "960x400", small: "480x200#"}
	validates_attachment_content_type :banner, content_type: /\Aimage\/.*\z/
end
