class UsersDatatable < BaseDatatable
  delegate :current_user, to: :@view

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: User.count,
      iTotalDisplayRecords: users.total_count,
      aaData: data
    }
  end

private
  def data
    users.map do |user|
      [
        link_to(user.name, user),
        user.franchise.try(:name),
        user.roles.map(&:name).join(', '),
        links(user)
      ]
    end
  end

  def users
    @users || fetch_users
  end

  def fetch_users
    users = User.includes(:franchise).references(:franchise).order(order_by(columns))

    if params[:sSearch].present?
      users = users.where('users.name like :search', search: "%#{params[:sSearch]}%")
    end
    users = users.page(page_count).per(per_page)
  end

  def columns
    ['users.name, franchises.name']
  end
end
