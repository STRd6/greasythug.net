class UsersController < ResourceController::Base
  actions :all, :except => :destroy

  before_filter :require_current_user, :only => [:edit, :update]

  show.wants.json do
    render :json => user.to_json(
      :only => [
        :id,
        :display_name
      ]
    )
  end

  private

  def require_current_user
    unless current_user == object
      flash[:notice] = "You can only edit your own account"
      redirect_to root_url
      return false
    end
  end

  def object
    return @object if defined?(@object)

    if params[:id] == "current"
      @object = current_user
    else
      @object = User.find(params[:id])
    end
  end

  def user
    object
  end
  helper_method :user
end
