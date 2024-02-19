class ErrorsController < ApplicationController
  def not_found
    # Render your error page here
    render 'not_found', status: :not_found
  end
end
