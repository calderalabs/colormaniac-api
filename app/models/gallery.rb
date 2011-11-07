class Gallery < ActiveRecord::Base
  has_many :paintings

  validates_presence_of :name

  def product_id
    "%02d" % id
  end

  def serializable_hash(options = nil)
	  super(:only => [], :methods => [:product_id])
	end
end
