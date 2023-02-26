# frozen_string_literal: true

class Api::V1::UsersController < APIApplicationController
  before_action :set_user, only: %i[show update destroy]
  wrap_parameters false

  MAILCHIMP_LIST_ID = 'b604a851dc'

  def destroy
    remove_from_mailing_list(@user)
    @user.destroy

    render json: {}, status: :ok
  end

  def update
    code = user_params[:organisation_code]
    organisation = { organisation_id: organisation_id_from_code(code) }.compact

    transformed_user_params = user_params.except(:organisation_code).except(:newsletter_signup).merge(organisation)
    @user.update(transformed_user_params)

    newsletter_signup = params.has_key?(:newsletter_signup) ? ActiveRecord::Type::Boolean.new.deserialize(params[:newsletter_signup]) : nil
    if newsletter_signup == true
      add_to_mailing_list(user) 
    elsif newsletter_signup == false
      remove_from_mailing_list(user) 
    end

    render json: user_response, status: :ok
  end

  def show
    render json: user_response, status: :ok
  end

  private

  def user_params
    params.permit(:email, :full_name, :location, :date_of_birth, :monthly_donation_limit, :home_owner, :organisation_code, :newsletter_signup)
  end

  def add_to_mailing_list(user)
    client = MailingListClient.new
    client.add_to_list(list_id: MAILCHIMP_LIST_ID, email_address: user.email, name: user.full_name)
  end

  def remove_from_mailing_list(user)
    client = MailingListClient.new
    client.remove_from_list(list_id: MAILCHIMP_LIST_ID, email_address: user.email)
  end

  def organisation_id_from_code(code)
    return nil unless code

    Organisation.find_by_code!(code).id
  end
end
