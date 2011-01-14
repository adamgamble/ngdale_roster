class Duty < ActiveRecord::Base
  scope :for_current_month, lambda {{:conditions => ["date > ? AND date < ?",Time.now.beginning_of_month, Time.now.end_of_month]}}
end
