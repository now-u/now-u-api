# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  def api_response (schema_component_name, list_response=false)
    object_type = { '$ref' => '#/components/schemas/' + schema_component_name }
    if list_response
      return {
        type: :object,
        properties: {
          data: {
            type: :array,
            items: object_type,
          }
        },
        additionalProperties: false,
        required: ["data"],
      }
    else
      return {
        type: :object,
        properties: {
          data: object_type,
        },
        additionalProperties: false,
        required: ["data"],
      }
    end
  end

  def get_schema_from_model (model, additional_properties)
    model_properties = model.column_names.reduce(additional_properties) { |res, column_name|
      column = model.column_for_attribute(column_name)
      if column.type == :datetime
        res[column_name.to_sym] = { type: :string, format: "date-time", nullable: column.null }
      else
        res[column_name.to_sym] = { type: column.type, nullable: column.null }
      end
      res
    }
    {
      type: :object,
      properties: model_properties,
      additionalProperties: false,
      # All fields are required (but may be nullable)
      required: model_properties.keys,
    }
  end
 
  cause_non_model_properties = {
    joined: {
      type: :boolean
    }
  }
  cause_schema = get_schema_from_model(Cause, cause_non_model_properties)
  faq_schema = get_schema_from_model(Faq, {})
  organisation_schema = get_schema_from_model(Organisation, {})
  organisation_list_schema = get_schema_from_model(
    Organisation,
    {
      campaigns: {
        type: :array,
        items: { '$ref' => '#/components/schemas/campaign' }
      }
    }
  )
  campaign_schema = get_schema_from_model(Campaign, {})
  press_article_schema = get_schema_from_model(PressCoverageArticle, {})
  news_article_schema = get_schema_from_model(Article, {})

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'now-u API',
        version: 'v2'
      },
      paths: {},
      servers: [
        {
          url: 'https://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'api.now-u.com'
            }
          }
        }
      ],
      components: {
        schemas: {
          cause: cause_schema,
          faq: faq_schema,
          organisation: organisation_schema,
          list_organisation: organisation_list_schema,
          press_article: press_article_schema,
          news_article: news_article_schema,
          campaign: campaign_schema,
        }
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml

  config.after do |example|
    next unless example.metadata[:type] == :request && response
    example.metadata[:response] && example.metadata[:response][:content] = {
      'application/json' => {
        example: JSON.parse(response.body, symbolize_names: true)
      }
    }
  end
end
