class UserSessionsController < ResourceController::Base
  actions :new, :create, :destroy

  skip_before_filter :verify_authenticity_token, :only => :create

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Successfully logged in."
          redirect_to root_url
        end
        format.json { render :json => current_user.to_json(:only => [:id, :display_name]) }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new' }
        format.json { render :json => @user_session.errors.to_json }
      end
    end
  end

  destroy.wants.html do
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end

  private

  def build_object
    @object ||= UserSession.new
  end

  def object
    @object ||= UserSession.find
  end
end
