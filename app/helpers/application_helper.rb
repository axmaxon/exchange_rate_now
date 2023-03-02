module ApplicationHelper
  def normalize_rate(rate)
    rate&.strftime('%d.%m.%Y %H:%M')
  end
end
