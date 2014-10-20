class Bill < ActiveRecord::Base
	acts_as_votable
	has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :cover, :content_type => ["image/jpg","image/jpeg","image/png"]
	
  validates :cover, presence: true
 	validates :title, presence: true
 	validates :category, presence: true
 	validates :summary, presence: true
 	validates :description, presence: true

 	# Additional Attributes
 	def score
  		self.get_upvotes.size - self.get_downvotes.size
  end
  def for
  		self.get_upvotes.size
  end
  def against
  		self.get_downvotes.size
  end
end
