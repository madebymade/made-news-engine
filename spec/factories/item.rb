FactoryGirl.define do
  factory :item, class: News::Item do
    id                         1
    title                      "Test"
    text                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula metus quis nisi condimentum vehicula. Aenean vel metus et ipsum egestas ultricies eu lacinia diam."       
    lead_image_file_name       "image.jpg"
    lead_image_content_type    "image/jpg"
    lead_image_file_size       "12345"
    lead_image_updated_at      "2013-01-01 00:00:00"
  end

  factory :related_link, class: News::RelatedLink do
    item_id                    1
    title                      "Test"
    text                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula metus quis nisi condimentum vehicula. Aenean vel metus et ipsum egestas ultricies eu lacinia diam."
    url                        "http://www.example.com"
    image_file_name            "image.jpg"
    image_content_type         "image/jpg"
    image_file_size            "12345"
    image_updated_at           "2013-01-01 00:00:00"
  end
end