module PlacesHelper
  def place_to_label(place)
    html = []
    html << link_to(place.name, place)
    html << place.street
    html << [[place.city, place.state].join(', '), place.postal_code].join(' ')
    html.join('<br/>')
  end

  def address(obj)
    html = []
    html << obj.street
    html << [[obj.city, obj.state].join(", "), obj.postal_code].join(" ")
    html.join("<br/>")
  end

  def categorize(place)
    place.category.split(',').delete_if{|x|x == 'Social'}
  end

  def display_hours(place)
    html = []
    return if place.hours.blank?
    place.hours.each do |day, hour|
      next if day.nil? or day.titleize != Date.today.strftime('%A')
      if hour.count > 1
        html << hour.map{|hr|hr.join(" - ")}.join(', ')
      else
        html << hour.join(' - ')
      end
    end
    html.join('<br/>')
  end
end
