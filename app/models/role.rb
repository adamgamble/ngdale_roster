class Role < ActiveRecord::Base
  scope :for_wednesday_night, lambda {{:conditions => {:wednesday_night => true}}}
  scope :for_sunday_morning,  lambda {{:conditions => {:sunday_morning => true}}}
  scope :for_sunday_night,    lambda {{:conditions => {:sunday_night => true}}}
  scope :for_all_month,       lambda {{:conditions => {:all_month => true}}}

  has_many :user_join_roles
  has_many :users, :through => :user_join_roles

  def to_s
    "#{name}"
  end

  def add_user_to_role! user
    return false if !user.is_a?(User)
    ujr = UserJoinRole.find(:first, :conditions => {:user_id => user.id, :role_id => id})
    if !ujr.is_a?(UserJoinRole)
      UserJoinRole.create(:user_id => user.id, :role_id => id) 
    end
  end
end
