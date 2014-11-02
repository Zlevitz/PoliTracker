class Representative < ActiveRecord::Base
	has_attached_file :headshot, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :headshot, :content_type => ["image/jpg","image/jpeg","image/png"]

	validates :headshot, presence: true
end
