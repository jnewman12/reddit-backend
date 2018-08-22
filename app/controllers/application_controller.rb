class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :cors_check
  
  def cors_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization, X-Auth-Token'
  end
end
