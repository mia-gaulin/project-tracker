require "rails_helper"

feature "add activity to a project" do
  # As a user
  # I want to add activity to a project
  # So I can track what I've done
  #
  # Acceptance Criteria
  #
  # [x] I must be on the project detail page
  # [x] I must provide a description
  # [x] I must be presented with errors if I fill out the form incorrectly

  scenario "user sees button to add activity" do
    project = FactoryGirl.create(:project)

    visit projects_path
    click_link project.title

    expect(page).to have_link "Add activity"
  end

  scenario "user adds activity" do
    project = FactoryGirl.create(:project)
    activity = Update.create(body: "This is activity.", project: project)

    visit projects_path
    click_link project.title
    click_link "Add activity"

    fill_in "Activity", with: activity
    click_button "Add activity"

    expect(page).to have_content "Activity successfully added!"
  end

  scenario "user submits blank input" do
    project = FactoryGirl.create(:project)

    visit projects_path
    click_link project.title
    click_link "Add activity"

    click_button "Add activity"

    expect(page).to have_content "Activity was not saved."
  end
end
