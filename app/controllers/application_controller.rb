class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token  #reminder - will have to look closer at this


end
