class Post < ActiveRecord::Base
belongs_to :forum , :counter_cache => true

named_scope :recent , :order => "id DESC"
end
