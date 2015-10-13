#
# Decorates a SavedSearch adding scheduling features
#
class SchedulableSearch < SimpleDelegator
  # The name used by resque schedulrer to identify this search once
  # its a scheduled job
  def schedule_name
    "saved_search_#{id}"
  end

  # Returns a Rufus format 'every' string eg
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

  def scheduled?
  end

  # Note Resque::Scheduler.dynamic = true must be set in Resque config
  # in order to use dynamic schedules
  def schedule!
    config = {}
    config[:class] = 'SendSearchResultsToAccountHolder'
    config[:every] = [every, { first_in: 5.minutes }]
    config[:persist] = true
    Resque.set_schedule(schedule_name, config)
  end

  def unschedule!
  end

  def reschedule!
  end

  def requires_rescheduling?
    changes = previous_changes.keys & %w(interval period)
    changes.any?
  end
end
