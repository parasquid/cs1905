class PreferencesController < ApplicationController
  def show
    # Load the preferences from the session
    # On the production application, this would either be sourced from an API
    # or retrieved from database storage. For now we're using the session as
    # the storage for preferences.
    # @preference = Preference.find(params[:id])
    @preference = session[:preference] || Preference.new
    @categories = Category.names

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def create
    @preference = Preference.new(params[:preference])

    respond_to do |format|
      session[:preference] = @preference

      # From the challenge requirements http://www.cloudspokes.com/challenges/1905
      # When you sumit the Preferences form, do something simple like writing the results to the terminal.
      # We'll eventually wire it up to the backend via the API.
      Rails.logger.info "******** Begin Saved Preferences ********"
      Rails.logger.info @preference
      Rails.logger.info "******** End Saved Preferences ********"

      format.html { redirect_to @preference, notice: 'Preference was successfully saved.' }
    end
  end

end
