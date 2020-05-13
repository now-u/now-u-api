# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

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
    description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis. Vestibulum tortor. Pellentesque purus. Donec pharetra, massa quis malesuada auctor, tortor ipsum lobortis ipsum, eget facilisis ante nisieget lectus. Sed a est. Aliquam nec felis eu sem euismod viverra. Suspendisse felis mi, dictum id, convallis ac, mattis non, nibh. Donec sagittis quam eu mauris. Phasellus et leo at quam dapibus pellentesque. In non lacus. Nullam tristique nunc ut arcu scelerisque aliquam. Nullam viverra magna vitae leo. Vestibulum in lacus sit amet lectus tempus aliquet. Duis cursus nisl ac orci. Donec non nisl. Mauris lacus sapien, congue a, facilisis at.',
    link: 'now-u.com',
    type: 'donation'
  },
  {
    title: 'Send this email',
    description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis. Vestibulum tortor. Pellentesque purus. Donec pharetra, massa quis malesuada auctor, tortor ipsum lobortis ipsum, eget facilisis ante nisieget lectus. Sed a est. Aliquam nec felis eu sem euismod viverra. Suspendisse felis mi, dictum id, convallis ac, mattis non, nibh. Donec sagittis quam eu mauris. Phasellus et leo at quam dapibus pellentesque. In non lacus. Nullam tristique nunc ut arcu scelerisque aliquam. Nullam viverra magna vitae leo. Vestibulum in lacus sit amet lectus tempus aliquet. Duis cursus nisl ac orci. Donec non nisl. Mauris lacus sapien, congue a, facilisis at.',
    link: 'now-u.com',
    type: 'email'
  },
  {
    title: 'Buy from this shop',
    description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis. Vestibulum tortor. Pellentesque purus. Donec pharetra, massa quis malesuada auctor, tortor ipsum lobortis ipsum, eget facilisis ante nisieget lectus. Sed a est. Aliquam nec felis eu sem euismod viverra. Suspendisse felis mi, dictum id, convallis ac, mattis non, nibh. Donec sagittis quam eu mauris. Phasellus et leo at quam dapibus pellentesque. In non lacus. Nullam tristique nunc ut arcu scelerisque aliquam. Nullam viverra magna vitae leo. Vestibulum in lacus sit amet lectus tempus aliquet. Duis cursus nisl ac orci. Donec non nisl. Mauris lacus sapien, congue a, facilisis at.',
    link: 'now-u.com',
    type: 'shop'
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
    logo_link: 'https://cdn.pixabay.com/photo/2013/04/16/14/23/eritrea-105081_960_720.jpg'
  },
  {
    name: 'Organisation 2',
    description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis.',
    logo_link: 'https://cdn.pixabay.com/photo/2013/04/16/14/23/eritrea-105081_960_720.jpg'
  },
  {
    name: 'Organisation 3',
    description: 'Et ipsum viverra malesuada. Duis luctus. Curabitur adipiscing metus et felis.',
    logo_link: 'https://cdn.pixabay.com/photo/2013/04/16/14/23/eritrea-105081_960_720.jpg'
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

campaigns.each do |campaign|
  x = Campaign.create!(campaign)
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

organisations.each do |organisation|
  Organisation.create!(organisation)
end

faqs.each do |faq|
  Faq.create!(faq)
end
