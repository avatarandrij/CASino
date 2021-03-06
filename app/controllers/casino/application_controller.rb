require 'casino'

class CASino::ApplicationController < CASino.config.base_controller.constantize
  include ApplicationHelper

  unless Rails.env.development?
    rescue_from ActionView::MissingTemplate, with: :missing_template
  end

  def cookies
    super
  end

  protected
  def missing_template(exception)
    render plain: 'Format not supported', status: :not_acceptable
  end
end
