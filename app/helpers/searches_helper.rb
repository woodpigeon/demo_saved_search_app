module SearchesHelper
  def formatted_interval(saved_search)
    "#{saved_search.interval} #{saved_search.period.to_s.pluralize(saved_search.interval)}"
  end
end
