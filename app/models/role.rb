class Role < ActiveRecord::Base
  PERIODS = ["Wednesday Night", "Sunday Morning","Sunday Night","All Month"]
  scope :for_wednesday_night, lambda {{:conditions => {:period => "Wednesday Night"}}}
  scope :for_sunday_morning,  lambda {{:conditions => {:period => "Sunday Morning"}}}
  scope :for_sunday_night,    lambda {{:conditions => {:period => "Sunday Night"}}}
  scope :for_all_month,       lambda {{:conditions => {:period => "All Month"}}}

  has_many :user_join_roles
  has_many :users, :through => :user_join_roles

  validates_inclusion_of :period, :in => PERIODS, :message => "Period must be either Wednesday Night, Sunday Morning, Sunday Night, or All Month"

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
