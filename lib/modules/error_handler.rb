# rescue expected errors and log them
module ErrorHandler
  def self.included(base)
    base.class_eval do
      rescue_from ActiveRecord::RecordNotFound do |exception|
        Rails.logger.warn(exception)

        redirect_back(fallback_location: root_path, alert: exception.message)
      end

      rescue_from ActiveRecord::RecordInvalid do |exception|
        Rails.logger.warn(exception)
        redirect_back(fallback_location: root_path, alert: exception.message)
      end
    end
  end
end
