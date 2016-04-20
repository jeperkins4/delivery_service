class PlacesDatatable < BaseDatatable
  delegate :current_user, :current_location, :place_to_label, :categorize, :display_hours, :cookies, :edit_place_path, to: :@view

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Place.count,
      iTotalDisplayRecords: places.total_count,
      aaData: data
    }
  end

private
  def data
    places.map do |place|
      [
        place_to_label(place),
        categorize(place),
        display_hours(place),
        nil,
        nil,
        place.distance(current_location),
        content_tag(:div, place.distance_in_time(current_location), id: "place_#{place.id}_quote_time")
      ]
    end
  end

  def places
    @places || fetch_places
  end

  def fetch_places
    places = Place.select(columns).order(order_by(columns))
    search_terms = params[:search][:value]
    if search_terms && search_terms.length > 2
      places = places.where('places.name like :search', search: "%#{search_terms}%")
    end
    places = places.available
    Kaminari.paginate_array(places).page(page_count).per(per_page)
  end

  def columns
    %w[places.name places.category places.hours places.id places.street places.city places.state places.postal_code places.latitude
    places.longitude places.estimated_prep_time places.actual_prep_time]
  end

  def exceptions
    ['places.id']
  end

  def origin
    cookies[:lat_lng].split('|').map(&:to_f)
  end

end
