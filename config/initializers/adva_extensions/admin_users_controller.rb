ActiveSupport::Reloader.to_prepare do
  Admin::UsersController.class_eval do
    def index
      @users = User.all
      @user_teams = UserTeams.new
    end

    def resend_confirmation
      if user = User.find_by(id: params[:user_id], verified_at: nil)
        user.generate_verification_key!
        Mailer.registration(user, user.unhashed_verification_key, request.host_with_port).deliver_now
        respond_to do |wants|
          wants.js { render json: nil, status: 204 }
          wants.html { redirect_to({ action: :index }, notice: "Confirmation email resent to #{user.email}") }
        end
      else
        respond_to do |wants|
          wants.js { render json: nil, status: 406 }
          wants.html { redirect_to({ action: :index }, alert: "User account is already confirmed!") }
        end
      end
    end
  end
end

