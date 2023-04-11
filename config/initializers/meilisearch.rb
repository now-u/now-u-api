MeiliSearch::Rails.configuration = {
  meilisearch_url: ENV['MEILI_URL'],
  meilisearch_api_key: ENV['MEILI_MASTER_KEY'],
  active: ENV['MEILI_ACTIVE'] == 'false' ? false : true,
}
