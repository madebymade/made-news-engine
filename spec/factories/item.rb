FactoryGirl.define do
  factory :item, class: News::Item do
    id                         1
    title                      "Test"
    text                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula metus quis nisi condimentum vehicula. Aenean vel metus et ipsum egestas ultricies eu lacinia diam."
    lead_image                 { File.new(News::Engine.root.join('spec', 'fixtures', 'test.jpg')) }
  end

  factory :related_link, class: News::RelatedLink do
    item_id                    1
    title                      "Test"
    text                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula metus quis nisi condimentum vehicula. Aenean vel metus et ipsum egestas ultricies eu lacinia diam."
    url                        "http://www.example.com"
    image                      { File.new(News::Engine.root.join('spec', 'fixtures', 'test.jpg')) }
    order                      1
  end
end
