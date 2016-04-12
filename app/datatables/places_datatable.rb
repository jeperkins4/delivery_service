class PlacesDatatable < BaseDatatable
  delegate :current_user, :place_to_label, :categorize, :display_hours, :edit_place_path, to: :@view

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
        nil
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
    %w[places.name places.category places.hours places.id places.street places.city places.state places.postal_code]
  end

  def exceptions
    ['places.id']
  end

end
