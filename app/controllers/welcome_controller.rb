class WelcomeController < ApplicationController
  skip_before_action :require_current_user

  def index; end
end
