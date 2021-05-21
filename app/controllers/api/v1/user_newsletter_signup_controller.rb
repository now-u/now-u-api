# frozen_string_literal: true

class Api::V1::UserNewsletterSignupController < APIApplicationController
  before_action :set_user, :set_client

  MAILCHIMP_LIST_ID = 'b604a851dc'

  def check_user
    subscriber = client.subscriber(list_id: MAILCHIMP_LIST_ID, email_address: @user.email)
    if subscriber && subscriber.status == 'subscribed'
      render json: {}, status: :ok
    else 
      render :text => 'Not Found', :status => 404
    end
  end

  def add_user
    @client.add_to_list(list_id: MAILCHIMP_LIST_ID, email_address: @user.email, name: @user.full_name)
    @user.update(newsletter: true)

    render json: { data: @user }, status: :ok
  end

  def update
    if params[:status] == 'subscribe'
      @client.add_to_list(list_id: MAILCHIMP_LIST_ID, email_address: @user.email, name: @user.full_name)
      @user.update(newsletter: true)
    else
      @client.remove_from_list(list_id: MAILCHIMP_LIST_ID, email_address: @user.email)
      @user.update(newsletter: false)
    end

    render json: { data: user_response }, status: :ok
  end

  def remove_user
    @client.remove_from_list(list_id: MAILCHIMP_LIST_ID, email_address: @user.email)
    @user.update(newsletter: false)

    render json: { data: @user }, status: :ok
  end

  private

  def set_client
    @client = MailingListClient.new
  end

end
