class OrdersDatatable < BaseDatatable
  delegate :current_user, to: :@view

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Order.count,
      iTotalDisplayRecords: orders.total_count,
      aaData: data
    }
  end

private
  def data
    orders.map do |order|
      [
        link_to(order.name, order)
      ]
    end
  end

  def orders
    @orders || fetch_orders
  end

  def fetch_orders
    search_columns = ['orders.name']
    orders = Order.unscoped.select(search_columns).order(sort_column sort_direction)
    orders = orders.page(page_count).per(per_page)
  end

  def sort_column
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
