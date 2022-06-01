module V1::ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { message: e.message, errors: 'Record not found' }, status: :not_found
    end
  end
end