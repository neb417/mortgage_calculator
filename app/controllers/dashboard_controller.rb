class DashboardController < ApplicationController
  include ActionView::Helpers::NumberHelper

  before_action :set_user
  def show
    @user
  end

  def monthly_payment
    @monthly_payment = calculate_monthly_payment(params[:home_price], params[:down_payment])
    @home_price = number_to_currency(params[:home_price])
    @down_payment = number_to_currency(params[:down_payment])
    respond_to do |format|
      format.html do
        render partial: 'dashboard/mortgage_calculator_form'
      end
    end
  end

  private

  def set_user
    @user ||= User.find(params[:id])
  end

  def calculate_monthly_payment(home_price, down_payment)
    payment = ((home_price.to_f - down_payment.to_f) * 0.08 / 60)
    number_to_currency(payment)
  end
end
