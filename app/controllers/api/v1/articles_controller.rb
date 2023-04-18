# frozen_string_literal: true

class Api::V1::ArticlesController < APIApplicationController
  def index
    page_size = Addressable::URI.parse(request.url).query_values["page_size"]

    Pagy::DEFAULT[:items] = page_size || 25
    @pagy, @articles = pagy(Article.active.order('video_of_the_day DESC, id DESC').all)

    render json: { data: @articles, pagination_metadata: get_pagy_metadata(@pagy, page_size) }, status: :ok
  end

  def show
    render json: { data: Article.find(params[:id]) }, status: :ok
  end

  private

  def get_pagy_metadata(metadata, page_size)
    {
      count: metadata.count,
      page: metadata.page,
      pages: metadata.pages,
      next: metadata.next,
      prev: metadata.prev,
      next_url: api_v1_articles_url(page_size: page_size, page: metadata.next),
      prev_url: api_v1_articles_url(page_size: page_size, page: metadata.prev)
    }
  end
end
