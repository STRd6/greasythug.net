class ScriptsController  < ResourceController::Base
  actions :all, :except => :destroy

  before_filter :require_creator, :only => [:edit, :update]

  create.before do
    object.creator = current_user
  end

  show.wants.json do
    render :json => script
  end

  index.wants.json do
    render :json => collection
  end

  private

  def require_creator
    current_user == script.creator
  end

  def collection
    scripts =
      if params[:domain].blank?
        Script
      else
        Script.with_domain(params[:domain])
      end

    scripts.paginate(:per_page => per_page, :page => params[:page])
  end

  def per_page
    20
  end

  def script
    object
  end
  helper_method :script
end
