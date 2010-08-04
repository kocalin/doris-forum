class Post < ActiveRecord::Base
belongs_to :user 
belongs_to :forum , :counter_cache => true
has_one :mugshot, :dependent => :destroy

accepts_nested_attributes_for :mugshot, :allow_destroy => true
named_scope :recent , :order => "id DESC"


  def is_post_user?(user)
    user &&(self.user_id == user.id)
  end

end
