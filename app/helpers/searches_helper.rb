module SearchesHelper
  def formatted_interval(saved_search)
    interval = saved_search.interval
    pluralized_period = saved_search.period.pluralize(interval)
    "#{interval} #{pluralized_period}"
  end
end
