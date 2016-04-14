class WelcomeDatatable < BaseDatatable
  delegate :current_user, to: :@view

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Welcome.count,
      iTotalDisplayRecords: welcomes.total_count,
      aaData: data
    }
  end

private
  def data
    welcomes.map do |welcome|
      [
        link_to(welcome.name, welcome)
      ]
    end
  end

  def welcomes
    @welcomes || fetch_welcomes
  end

  def fetch_welcomes
    search_columns = ['welcomes.name']
    welcomes = Welcome.unscoped.select(search_columns).order(sort_column sort_direction)
    welcomes = welcomes.page(page_count).per(per_page)
  end

  def sort_column
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
