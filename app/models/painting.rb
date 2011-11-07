class Painting < ActiveRecord::Base
  belongs_to :gallery

  has_attached_file :picture,
                    :styles => { :normal => ["832x768>", :png], :thumb => ["130x130>", :png] },
                    :storage => :s3,
                    :path => ":attachment/:id/:style.png",
                    :s3_credentials => File.join(Rails.root, 'config', 's3.yml')

  validates_attachment_presence :picture

  validates_presence_of :picture, :title, :author, :gallery_id

  def serializable_hash(options = nil)
	  super(:only => [:id, :title, :author])
	end
end
