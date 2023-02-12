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
    field :title do
      required true
    end
    field :short_name do
      required true
    end
    field :description_app do
      label "Description"
      required true
    end
    field :header_image_s3 do
      label "Header image"
      required true
    end
    # NOTE: Video link is not currently used
    # field :video_link
    field :enabled
    field :start_date
    field :end_date
    # NOTE: Not sure if we use this
    # field :infographic_url
    field :of_the_month
    field :recommended
    # TODO We should probably remove enabled and add this to every model (and
    # check it works)
    field :status do
      required true
    end

    field :campaign_actions
    field :learning_resources
    field :causes
  end

  config.model 'CampaignAction' do
    label "Action"

    field :title do
      required true
    end
    field :link do
      required true
    end
    field :type do
      required true
    end
    field :what_description do
      required true
    end
    field :why_description do
      required true
    end
    field :time do
      required true
    end
    field :enabled
    field :release_date
    field :end_date
    field :of_the_month
    field :recommended
    field :causes
  end

  config.model 'Cause' do
    field :name do
      required true
    end
    field :icon do
      required true
    end
    field :description do 
      required true
    end
    field :image_s3 do
      label "Image"
      required true
    end
    field :campaign_actions do
      label "Actions"
    end
    field :learning_resources do
      label "Learning Resources"
    end
    field :campaigns do
      label "Campaigns"
    end
  end

  config.model 'LearningResource' do
    field :title do
      required true
    end
    field :time do
      required true
    end
    field :link do
      required true
    end
    field :type do
      required true
    end
    field :source do
      required true
    end
    field :learning_topic do
      required false 
    end
    field :release_date
    field :end_date
    field :causes
  end
  
  config.model 'Article' do
    field :title do
      required true
    end
    field :subtitle do
      required true
    end
    field :source
    field :full_article_link do
      required true
    end
    field :header_image_s3 do
      label "Header image"
      required true
    end
    field :release_date
    field :enabled
  end
end
