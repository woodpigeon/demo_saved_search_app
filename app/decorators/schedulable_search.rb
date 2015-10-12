class SchedulableSearch < SimpleDelegator
  # Returns Rufus format 'every' string eg
  # 10M for 10 months
  # 1d for 1 day
  def every
    "#{interval}#{abbreviated_period}"
  end

  # 'M' for month
  # 'w' for week
  # 'd' for day
  # 'h' for hour
  # 'm' for minute
  def abbreviated_period
    case period
    when 'month' then 'M'
    else period[0] # first char e.g. 'w' for week
    end
  end
end
