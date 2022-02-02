RailsAdmin.config do |config|
  config.main_app_name = ["Now U API Admin"]


  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard
    index     
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Campaign' do
    field :title
    field :description_app
    field :header_image
    field :video_link
    field :description_web
    field :enabled
    field :start_date
    field :end_date
    field :short_name
    field :infographic_url
    field :of_the_month
    field :recommended
    field :status
    field :campaign_actions
    field :blog_articles
    field :articles
    field :offers
    field :partnerships
    field :learning_topics
    field :organisations
    field :campaign_goals
    field :goals
    field :user_campaigns
    field :cause_campaigns
    field :causes do
      required true
    end
  end
end
