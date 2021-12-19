class ApplicationController < ActionController::API

    rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

  def rescue_from_record_not_found exception_obj
    render json: {error: "#{exception_obj.model} not found"}, status: :not_found
  end

  def invalid_record(exception_obj)
    render json: {error: exception_obj.record.errors.full_messages }, status: :unprocessable_entity
  end
  
end
