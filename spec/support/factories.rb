FactoryGirl.define do

  factory :project do
    title "Learn to use Factory Girl"
    description "Use Factory Girl in spec tests to figure out how to use it"
    github_link "http://fake.com"
  end

  factory :feature do
    body "Write another factory!"
    project project
  end
end
