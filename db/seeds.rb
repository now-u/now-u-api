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
  { title: 'Reduced Inequalities', type: 'United Nations Sustainable Development Goal' },
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
    title: 'Domestic abuse',
    description_app: "14 women and 2 children were killed through domestic violence in the UK in the first three weeks of lockdown.\nRight now, while the ‘stay at home’ guidance protects people from coronavirus, it does not protect individuals from the danger posed by others. The crisis isn't just damaging our economy, it's endangering our welfare, as domestic abuse rates have soared.\nThis campaign focuses on raising awareness, supporting amazing domestic abuse charities, and advocating for better prevention and support services across the UK.",
    description_web: "14 women and two children were killed through domestic violence in the UK in the first three weeks of lockdown (Counting Dead Women Project).<br>Right now, while the ‘stay at home’ guidance protects people from coronavirus, it does not protect individuals from the danger posed by others. The crisis isn't just damaging our economy, it's endangering our welfare, as domestic abuse rates are soaring.<br>Already over-stretched services are now under even greater pressure. Last year 64% of refuge referrals were declined, leaving many with no escape from their abusive partners (women’s aid).<br>The 2020 Domestic Abuse Bill, currently being debated in parliament, would require local authorities to provide long-term victim support and enhanced housing assistance. We hope these political changes will help in the long term, but the effects of this Bill will not provide immediate relief. <br>This campaign focuses on supporting amazing domestic abuse charities working tirelessly to provide both immediate relief and long-term support to people affected by domestic abuse. We connect you with actions to help increase awareness, raise funds and advocate for better prevention and support services across the UK.",
    number_of_campaigners: 0,
    header_image: 'https://images.unsplash.com/photo-1444681179373-730055ddc7b6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
    video_link: 'https://www.youtube.com/watch?v=h5vnFpWCOhQ',
    goals: ['Gender Equality']
  },
  {
    title: 'Refugee welfare & resettlement',
    description_app: "Over 70 million people worldwide have been forced to flee their homes. Whilst the vast majority remain in their own or neighbouring countries, tens of thousands of people have died trying to reach safety in Europe. Those who do make it are rarely welcomed with support and compassion. People are beaten, gassed and locked up. Several have been killed - adults and children alike.\nThis campaign raises awareness about refugees and asylum seekers in Europe. We connect you with actions to help improve their welfare and fight for the resettlement of people who are displaced, at risk and without a place to call home.",
    description_web: "70 million people worldwide have been forced to leave their homes to seek refuge, risking everything in search of a safe environment where they can rebuild their lives (UNHCR).<br>The vast majority remain in their own or neighbouring countries, with little or no support. Others embark on long and dangerous journeys to Europe, often encountering starvation, sickness and violence along the way. Tens of thousands of people have died trying to reach safety in Europe. Those who do make it are rarely welcomed with support and compassion. People are beaten, gassed and locked up. Several have been killed - adults and children alike.<br>Did you know that many towns across Europe have offered their support but had their request denied by governments? Hostile policies are preventing people from being reunited with family, finding safe homes and becoming valued members of our communities.<br>This campaign raises awareness about the lives of refugees and asylum seekers in Europe. We connect you with actions to help improve their welfare andand fight for the resettlement of people who are displaced, at risk and without a place to call home.<br>Together we can help change the lives of thousands and reform policies to empower future generations of refugees and asylum seekers to rebuild their lives.",
    number_of_campaigners: 0,
    header_image: 'https://images.unsplash.com/photo-1551556729-c8dee4337009?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
    video_link: 'https://www.youtube.com/watch?v=h5vnFpWCOhQ',
    goals: ['Reduced Inequalities']
  },
  {
    title: 'Water, sanitation & hygiene',
    description_app: "1 in every 10 people still do not have access to clean water, and every minute a newborn child dies from an infection caused by a lack of this basic human right.\nWithout clean water, sanitation and hygiene (WASH), every aspect of human welfare suffers and diseases thrive. Right now, in the midst of COVID-19, this issue is more pressing than ever; without WASH we lose our first line of defence against the spread of the virus.\nThis campaign promotes awareness about the importance of WASH systems in low- and middle-income countries. We give you easy actions to advocate for WASH for all, and to support amazing WASH charities who are transforming the lives of millions.",
    description_web: "1 in every 10 people still do not have access to clean water, and every minute a newborn child dies from an infection caused by a lack of this basic human right (WHO).<br>Without clean water, sanitation and hygiene (WASH), every aspect of human welfare suffers and diseases thrive. What’s more, rising populations and an increase of droughts and flooding has put even more pressure on water security.<br>Right now, in the midst of COVID-19, this issue is more pressing than ever; without WASH we lose our first line of defence against the spread of the virus. To make matters worse, for those living in overcrowded urban settlements and slums, physical distancing measures are impossible. With 3 billion people (that’s 2 in every 5) still without hand-washing facilities at home, the pandemic is exacerbating existing WASH inequalities, and placing huge pressures on the countries already struggling most.<br>This campaign promotes awareness about the importance of WASH systems in developing countries, not only for the current crisis, but for the long-term welfare of millions of people living in poverty. We give you easy actions to advocate for WASH for all, and to support amazing WASH charities who are transforming the lives of millions.",
    number_of_campaigners: 0,
    header_image: 'https://images.unsplash.com/photo-1437914983566-976d85602771?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
    video_link: 'https://www.youtube.com/watch?v=h5vnFpWCOhQ',
    goals: ['Clean Water and Sanitation']
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
    campaign_name: 'Domestic abuse',
    type: 'campaign'
  },
  {
    organisation_name: 'Organisation 2',
    campaign_name: 'Refugee welfare & resettlement',
    type: 'general'
  },
  {
    organisation_name: 'Organisation 3',
    campaign_name: 'Water, sanitation & hygiene',
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
  # pp campaign
  # pp Campaign.new.attributes.keys
  # pp campaign.slice(*Campaign.new.attributes.keys)
  x = Campaign.create!(campaign.slice(*Campaign.new.attributes.keys.map(&:to_sym)))
  campaign[:goals].each { |g| goal = Goal.find_by(title: g); CampaignGoal.create!(campaign_id: x.id, goal_id: goal.id) }
  # Goal.all.sample(3).each { |g| CampaignGoal.create!(campaign_id: x.id, goal_id: g.id) }
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
# pp Campaign.all
partnerships.each do |x|
  org = Organisation.find_by(name: x[:organisation_name])
  campaign = Campaign.find_by(title: x[:campaign_name])
  # pp campaign
  # pp x
  Partnership.create!(organisation_id: org.id, campaign_id: campaign.id, type: x[:type])
end

Article.last.update(video_of_the_day: true)
