require "rails_helper"

feature "user may view all features of a project" do
  # As a user
  # I want to view the features for a project
  # So I have a roadmap of what to build
  #
  # Acceptance Criteria
  #
  # [x] I must be on the project detail page
  # [x] I must only see features for the project I'm viewing
  # [x] I must see all features, with the most recently updated first

  scenario "view list of features" do
    project = FactoryGirl.create(:project)
    feature = Feature.create(body: "This is a feature idea.", project: project)

    visit projects_path
    click_link project.title

    expect(page).to have_content feature.body
  end

  scenario "cannot see features from other projects" do
    project = FactoryGirl.create(:project)
    project2 = FactoryGirl.create(:project, title: "Different project")
    feature = Feature.create(body: "This is a feature idea.", project: project)
    feature2 = Feature.create(body: "This shouldn't show up.", project: project2)

    visit projects_path
    click_link project.title

    expect(page).to have_content feature.body
    expect(page).to_not have_content feature2.body
  end

  scenario "most recently updated feature is listed first" do
    project = FactoryGirl.create(:project)
    feature = Feature.create(body: "This is a feature idea.", project: project)
    feature2 = Feature.create(body: "This should be at the top.", project: project)

    visit projects_path
    click_link project.title

    expect(feature2.body).to appear_before(feature.body)
  end
end
