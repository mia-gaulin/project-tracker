require "rails_helper"

feature "add a feature to a project" do
  # As a user
  # I want to add a feature to a project
  # So that I can keep track of all ideas
  #
  # Acceptance Criteria
  #
  # [x] I must be on the project detail page
  # [x] I must provide a description
  # [x] I must be presented with errors if I fill out the form incorrectly

  scenario "user sees button to add feature" do
    project = FactoryGirl.create(:project)

    visit projects_path
    click_link project.title

    expect(page).to have_link "Add feature"
  end

  scenario "user adds a feature" do
    project = FactoryGirl.create(:project)
    feature = Feature.create(body: "This is a feature idea.", project: project)
    update = Update.create(body: "This is activity.", project: project)

    visit projects_path
    click_link project.title
    click_link "Add feature"

    fill_in "Description", with: feature
    click_button "Add feature"

    expect(page).to have_content "Feature successfully added!"
  end

  scenario "user submits blank input" do
    project = FactoryGirl.create(:project)
    feature = Feature.create(body: "This is a feature idea.", project: project)
    update = Update.create(body: "This is activity.", project: project)

    visit projects_path
    click_link project.title
    click_link "Add feature"

    click_button "Add feature"

    expect(page).to have_content "Feature was not saved."
  end
end
