module Api
  module V1
    class SessionsController < ActionController::Base
      respond_to :json
      def create
        if params[:password] && !User.weak_words.include?(params[:password])
          status = { status: 'success' }
        else
          status = { status: 'failure' }
        end
        respond_with status
      end
    end
  end
end
