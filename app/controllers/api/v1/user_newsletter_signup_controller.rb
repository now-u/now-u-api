# frozen_string_literal: true

class Api::V1::UserNewsletterSignupController < ApplicationController
  before_action :set_user, :set_mailing_list_id

  def update
    client = MailingListClient.new
    if params[:status] == 'subscribe'
      client.add_to_list(list_id: MAILCHIMP_LIST_ID, email_address: @user.email, name: @user.full_name)
      @user.update(newsletter: true)
    else
      client.remove_from_list(list_id: MAILCHIMP_LIST_ID, email_address: @user.email)
      @user.update(newsletter: false)
    end

    render json: { data: user_response }, status: :ok
  end

  def toggle
    client = MailingListClient.new
    if client.subscriber(list_id: MAILCHIMP_LIST_ID, email_address: @user.email).status == 'subscribed'
      client.remove_from_list(list_id: MAILCHIMP_LIST_ID, email_address: @user.email)
      @user.update(newsletter: false)
    else
      client.add_to_list(list_id: MAILCHIMP_LIST_ID, email_address: @user.email, name: @user.full_name)
      @user.update(newsletter: true)
    end
  end
end
