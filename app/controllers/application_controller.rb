# frozen_string_literal: true
require 'net/https'
class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  RECAPTCHA_MINIMUM_SCORE = 0.5
  rescue_from User::EmailTaken do |_exception|
    redirect_to root_path, notice: t('devise.registrations.signed_up_but_unconfirmed')
  end
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def render_404
    render :file => "#{Rails.root}/public/404.html",  :status => 404
  end
  
  site_key = ENV['RECAPTCHA_SITE_KEY']

  def authenticate_employee_user!
    authenticate_user!
    unless current_user.employees.exists?
      flash[:flash] = 'Unauthorized Access!'
      redirect_to root_path

    end
  end
  rescue_from User::EmailTaken do |_exception|
    redirect_to root_path, notice: t('devise.registrations.signed_up_but_unconfirmed')
  end
  def verify_recaptcha?(token, recaptcha_action)
    secret_key = ENV['RECAPTCHA_SECRET_KEY']
    uri = URI.parse("https://www.google.com/recaptcha/api/siteverify?secret=#{secret_key}&response=#{token}")
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)
    json['success'] && json['score'] > RECAPTCHA_MINIMUM_SCORE && json['action'] == recaptcha_action
  end
end
