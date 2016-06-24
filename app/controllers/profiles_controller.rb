class ProfilesController < ApplicationController
  after_action :verify_authorized

  def edit
    @profile = current_user.profile
    authorize @profile
    if @profile.phones.empty?
      @profile.phones << Phone.new(phone_type: 'Mobile', number: '11')
      @profile.phones << Phone.new(phone_type: 'Mobile', number: '22')
      @profile.phones << Phone.new(phone_type: 'Mobile', number: '33')
    end
  end

  def update
    @profile = current_user.profile
    authorize @profile
    @profile.update!(profile_params)
    flash[:notice] = "Your profile has been updated."
    render 'edit'
  end

  private

  def profile_params
    params
      .require(:profile)
      .permit(
        :first_name,
        :last_name,
        :date_of_birth,
        phones_attributes: [
        :id,
        :phone_type,
        :number,
        :_destroy
        ])
  end
end
