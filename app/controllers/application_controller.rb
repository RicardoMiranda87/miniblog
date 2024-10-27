class ApplicationController < ActionController::Base
  include Pundit
  # Configurações adicionais
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Você não está autorizado a realizar essa ação."
    redirect_to(request.referer || root_path)
  end
end
