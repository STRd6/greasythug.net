class ScriptsController  < ResourceController::Base
  actions :all, :except => :destroy

  before_filter :require_creator, :only => [:edit, :update]

  create.before do
    object.creator = current_user
  end

  show.wants.json do
    render :json => script
  end

  private

  def require_creator
    current_user == script.creator
  end

  def script
    object
  end
  helper_method :script
end
