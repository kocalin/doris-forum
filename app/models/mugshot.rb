class Mugshot < ActiveRecord::Base
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :max_size => 500.kilobytes,
                 :resize_to => '320x200>',
		 :path_prefix => 'public/post_images',
                 :thumbnails => { :thumb => '100x100>' }
  validates_as_attachment
  belongs_to  :post
end
