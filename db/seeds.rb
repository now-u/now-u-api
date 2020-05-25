# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

goals = [
  { title: 'No Poverty', type: 'United Nations Sustainable Development Goal' },
  { title: 'Zero Hunger', type: 'United Nations Sustainable Development Goal' },
  { title: 'Good Health and Well-being', type: 'United Nations Sustainable Development Goal' },
  { title: 'Quality Education', type: 'United Nations Sustainable Development Goal' },
  { title: 'Gender Equality', type: 'United Nations Sustainable Development Goal' },
  { title: 'Clean Water and Sanitation', type: 'United Nations Sustainable Development Goal' },
  { title: 'Affordable and Clean Energy', type: 'United Nations Sustainable Development Goal' },
  { title: 'Decent Work and Economic Growth', type: 'United Nations Sustainable Development Goal' },
  { title: 'Industry, Innovation, and Infrastructure', type: 'United Nations Sustainable Development Goal' },
  { title: 'Reduced Inequality', type: 'United Nations Sustainable Development Goal' },
  { title: 'Sustainable Cities and Communities', type: 'United Nations Sustainable Development Goal' },
  { title: 'Responsible Consumption and Production', type: 'United Nations Sustainable Development Goal' },
  { title: 'Climate Action', type: 'United Nations Sustainable Development Goal' },
  { title: 'Life Below Water', type: 'United Nations Sustainable Development Goal' },
  { title: 'Life On Land', type: 'United Nations Sustainable Development Goal' },
  { title: 'Peace, Justice, and Strong Institutions', type: 'United Nations Sustainable Development Goal' },
  { title: 'Partnerships for the Goals', type: 'United Nations Sustainable Development Goal' },
]
goals.each { |x| Goal.create!(x) }

campaigns = [
  {
    title: 'Refugees',
    description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis. Vestibulum tortor. Pellentesque purus. Donec pharetra, massa quis malesuada auctor, tortor ipsum lobortis ipsum, eget facilisis ante nisieget lectus. Sed a est. Aliquam nec felis eu sem euismod viverra. Suspendisse felis mi, dictum id, convallis ac, mattis non, nibh. Donec sagittis quam eu mauris. Phasellus et leo at quam dapibus pellentesque. In non lacus. Nullam tristique nunc ut arcu scelerisque aliquam. Nullam viverra magna vitae leo. Vestibulum in lacus sit amet lectus tempus aliquet. Duis cursus nisl ac orci. Donec non nisl. Mauris lacus sapien, congue a, facilisis at.',
    number_of_campaigners: 123,
    header_image: 'https://cdn.pixabay.com/photo/2013/04/16/14/23/eritrea-105081_960_720.jpg',
    video_link: 'https://www.youtube.com/watch?v=K44A8iWcnhc'
  },
  {
    title: 'Corona',
    description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis. Vestibulum tortor. Pellentesque purus. Donec pharetra, massa quis malesuada auctor, tortor ipsum lobortis ipsum, eget facilisis ante nisieget lectus. Sed a est. Aliquam nec felis eu sem euismod viverra. Suspendisse felis mi, dictum id, convallis ac, mattis non, nibh. Donec sagittis quam eu mauris. Phasellus et leo at quam dapibus pellentesque. In non lacus. Nullam tristique nunc ut arcu scelerisque aliquam. Nullam viverra magna vitae leo. Vestibulum in lacus sit amet lectus tempus aliquet. Duis cursus nisl ac orci. Donec non nisl. Mauris lacus sapien, congue a, facilisis at.',
    number_of_campaigners: 234,
    header_image: 'https://cdn.pixabay.com/photo/2013/04/16/14/23/eritrea-105081_960_720.jpg',
    video_link: 'https://www.youtube.com/watch?v=K44A8iWcnhc'
  },
  {
    title: 'Other',
    description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis. Vestibulum tortor. Pellentesque purus. Donec pharetra, massa quis malesuada auctor, tortor ipsum lobortis ipsum, eget facilisis ante nisieget lectus. Sed a est. Aliquam nec felis eu sem euismod viverra. Suspendisse felis mi, dictum id, convallis ac, mattis non, nibh. Donec sagittis quam eu mauris. Phasellus et leo at quam dapibus pellentesque. In non lacus. Nullam tristique nunc ut arcu scelerisque aliquam. Nullam viverra magna vitae leo. Vestibulum in lacus sit amet lectus tempus aliquet. Duis cursus nisl ac orci. Donec non nisl. Mauris lacus sapien, congue a, facilisis at',
    number_of_campaigners: 345,
    header_image: 'https://cdn.pixabay.com/photo/2013/04/16/14/23/eritrea-105081_960_720.jpg',
    video_link: 'https://www.youtube.com/watch?v=K44A8iWcnhc'
  }
]


actions = [
  {
    title: 'Donate to these other people',
    what_description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis. Vestibulum tortor. Pellentesque purus. Donec pharetra, massa quis malesuada auctor, tortor ipsum lobortis ipsum, eget facilisis ante nisieget lectus. Sed a est. Aliquam nec felis eu sem euismod viverra. Suspendisse felis mi, dictum id, convallis ac, mattis non, nibh. Donec sagittis quam eu mauris. Phasellus et leo at quam dapibus pellentesque. In non lacus. Nullam tristique nunc ut arcu scelerisque aliquam. Nullam viverra magna vitae leo. Vestibulum in lacus sit amet lectus tempus aliquet. Duis cursus nisl ac orci. Donec non nisl. Mauris lacus sapien, congue a, facilisis at.',
    why_description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis.',
    link: 'now-u.com',
    type: 'donation',
    time: 2.5
  },
  {
    title: 'Send this email',
    what_description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis. Vestibulum tortor. Pellentesque purus. Donec pharetra, massa quis malesuada auctor, tortor ipsum lobortis ipsum, eget facilisis ante nisieget lectus. Sed a est. Aliquam nec felis eu sem euismod viverra. Suspendisse felis mi, dictum id, convallis ac, mattis non, nibh. Donec sagittis quam eu mauris. Phasellus et leo at quam dapibus pellentesque. In non lacus. Nullam tristique nunc ut arcu scelerisque aliquam. Nullam viverra magna vitae leo. Vestibulum in lacus sit amet lectus tempus aliquet. Duis cursus nisl ac orci. Donec non nisl. Mauris lacus sapien, congue a, facilisis at.',
    why_description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis.',
    link: 'now-u.com',
    type: 'email',
    time: 2.5
  },
  {
    title: 'Buy from this shop',
    what_description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis. Vestibulum tortor. Pellentesque purus. Donec pharetra, massa quis malesuada auctor, tortor ipsum lobortis ipsum, eget facilisis ante nisieget lectus. Sed a est. Aliquam nec felis eu sem euismod viverra. Suspendisse felis mi, dictum id, convallis ac, mattis non, nibh. Donec sagittis quam eu mauris. Phasellus et leo at quam dapibus pellentesque. In non lacus. Nullam tristique nunc ut arcu scelerisque aliquam. Nullam viverra magna vitae leo. Vestibulum in lacus sit amet lectus tempus aliquet. Duis cursus nisl ac orci. Donec non nisl. Mauris lacus sapien, congue a, facilisis at.',
    why_description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis.',
    link: 'now-u.com',
    type: 'shop',
    time: 2.5
  }
]


articles = [
  {
    title: 'Article Title',
    body: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis. Vestibulum tortor. Pellentesque purus. Donec pharetra, massa quis malesuada auctor, tortor ipsum lobortis ipsum, eget facilisis ante nisieget lectus. Sed a est. Aliquam nec felis eu sem euismod viverra. Suspendisse felis mi, dictum id, convallis ac, mattis non, nibh. Donec sagittis quam eu mauris. Phasellus et leo at quam dapibus pellentesque. In non lacus. Nullam tristique nunc ut arcu scelerisque aliquam. Nullam viverra magna vitae leo. Vestibulum in lacus sit amet lectus tempus aliquet. Duis cursus nisl ac orci. Donec non nisl. Mauris lacus sapien, congue a, facilisis at.',
    header_image: 'https://cdn.pixabay.com/photo/2013/04/16/14/23/eritrea-105081_960_720.jpg',
    full_article_link: 'https://www.bbc.com/news/live/world-52495737',
    video_link: 'https://www.youtube.com/watch?v=K44A8iWcnhc'
  }
]

offers = [
  {
    title: 'Offer Title',
    description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis. Vestibulum tortor. Pellentesque purus. Donec pharetra, massa quis malesuada auctor, tortor ipsum lobortis ipsum, eget facilisis ante nisieget lectus. Sed a est. Aliquam nec felis eu sem euismod viverra. Suspendisse felis mi, dictum id, convallis ac, mattis non, nibh. Donec sagittis quam eu mauris. Phasellus et leo at quam dapibus pellentesque. In non lacus. Nullam tristique nunc ut arcu scelerisque aliquam. Nullam viverra magna vitae leo. Vestibulum in lacus sit amet lectus tempus aliquet. Duis cursus nisl ac orci. Donec non nisl. Mauris lacus sapien, congue a, facilisis at.',
    link: 'https://www.bbc.com/news/live/world-52495737'
  }
]

organisations = [
  {
    name: 'Organisation 1',
    description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis.',
    logo_link: 'https://cdn.pixabay.com/photo/2013/04/16/14/23/eritrea-105081_960_720.jpg',
    email: 'test@test.com',
    website: 'test.com'
  },
  {
    name: 'Organisation 2',
    description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis.',
    logo_link: 'https://cdn.pixabay.com/photo/2013/04/16/14/23/eritrea-105081_960_720.jpg',
    email: 'test@test.com',
    website: 'test.com'
  },
  {
    name: 'Organisation 3',
    description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis.',
    logo_link: 'https://cdn.pixabay.com/photo/2013/04/16/14/23/eritrea-105081_960_720.jpg',
    email: 'test@test.com',
    website: 'test.com'
  }
]
organisations.each do |organisation|
  Organisation.create!(organisation)
end


partnerships = [
  {
    organisation_name: 'Organisation 1',
    campaign_name: 'Refugees',
    type: 'campaign'
  },
  {
    organisation_name: 'Organisation 2',
    campaign_name: 'Corona',
    type: 'general'
  },
  {
    organisation_name: 'Organisation 3',
    campaign_name: 'Other',
    type: 'general'
  }
]

faqs = [
  {
    question: 'Et ipsum viverra malesuada duis luctus?',
    answer: 'Curabitur adipiscing metus et felis.'
  },
  {
    question: 'Et ipsum viverra malesuada duis luctus?',
    answer: 'Curabitur adipiscing metus et felis.'
  },
  {
    question: 'Et ipsum viverra malesuada duis luctus?',
    answer: 'Curabitur adipiscing metus et felis.'
  }
]
faqs.each do |faq|
  Faq.create!(faq)
end

learning_topics = {
  topic: {
    title: 'Et ipsum viverra malesuada duis luctus?',
    image_link: 'https://cdn.pixabay.com/photo/2013/04/16/14/23/eritrea-105081_960_720.jpg',
    our_answer: 'Curabitur adipiscing metus et felis.'
  },
  resource: {
    title: 'My resource',
    time: 1.0,
    link: 'https://www.bbc.com/news/live/world-52495737',
    type: 'article'
  }
}

campaigns.each do |campaign|
  x = Campaign.create!(campaign)
  Goal.all.sample(3).each { |g| CampaignGoal.create!(campaign_id: x.id, goal_id: g.id) }
  topic = x.learning_topics.create!(learning_topics[:topic])
  topic.learning_resources.create!(learning_topics[:resource])
  actions.each do |action|
    new_action = x.actions.create!(action)
    articles.each do |article|
      new_action.articles.create!(article.merge(campaign_id: x.id))
    end
    offers.each do |offer|
      new_action.offers.create!(offer.merge(campaign_id: x.id))
    end
  end
end

partnerships.each do |x|
  org = Organisation.find_by(name: x[:organisation_name])
  campaign = Campaign.find_by(title: x[:campaign_name])
  Partnership.create!(organisation_id: org.id, campaign_id: campaign.id, type: x[:type])
end

Article.last.update(video_of_the_day: true)
