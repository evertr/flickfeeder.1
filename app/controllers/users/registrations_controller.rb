class Users::RegistrationsController < Devise::RegistrationsController

  include ApplicationHelper

  def create
    super
    # TODO: sometimes current_user is null, cannot reproduce the problem..
    if current_user
      current_user.update_attributes(
        first_name: params[:user][:first_name].capitalize, 
        last_name: params[:user][:last_name].capitalize
      )
    end

    if current_user && current_user.email.include?('@flickfeeder.com')
      current_user.update_attributes(user_type: "admin")
    end
  end

  def new
    @organizations = Organization.all
    super
  end

  def edit

    super
  end

  private

end
