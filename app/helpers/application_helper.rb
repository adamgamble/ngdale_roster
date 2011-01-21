module ApplicationHelper
  def number_of_sundays_for_month month
    number_of_sundays = 0
    number_of_days_in_month = month.end_of_month.day
    number_of_days_in_month.times do |i|
      number_of_sundays += 1 if month.beginning_of_month.advance(:days => i).strftime("%a") == "Sun"
    end
    number_of_sundays
  end

  def number_of_wednesdays_for_month month
    number_of_wednesdays = 0
    number_of_days_in_month = month.end_of_month.day
    number_of_days_in_month.times do |i|
      number_of_wednesdays += 1 if month.beginning_of_month.advance(:days => i).strftime("%a") == "Wed"
    end
    number_of_wednesdays
  end

  def nth_sunday_of_the_month n, month
    Chronic.parse("#{n.ordinalize} sunday in #{month.strftime("%b")}")
  end

  def nth_wednesday_of_the_month n, month
    Chronic.parse("#{n.ordinalize} wednesday in #{month.strftime("%b")}")
  end
end
