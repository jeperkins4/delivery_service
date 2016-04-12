class FranchisesDatatable < BaseDatatable
  delegate :current_user, to: :@view

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Franchise.count,
      iTotalDisplayRecords: franchises.total_count,
      aaData: data
    }
  end

private
  def data
    franchises.map do |franchise|
      [
        link_to(franchise.name, franchise)
      ]
    end
  end

  def franchises
    @franchises || fetch_franchises
  end

  def fetch_franchises
    search_columns = ['franchises.name']
    franchises = Franchise.unscoped.select(search_columns).order(sort_column sort_direction)
    franchises = franchises.page(page_count).per(per_page)
  end

  def sort_column
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
