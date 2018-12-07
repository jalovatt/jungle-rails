module AdminOnly extend ActiveSupport::Concern

  USER = {ENV["ADMIN_USERNAME"] => ENV["ADMIN_PASSWORD"]}

  included do
    before_action :authenticate
  end

  private

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["ADMIN_USERNAME"] && password = ENV["ADMIN_PASSWORD"]
      end
    end

end
