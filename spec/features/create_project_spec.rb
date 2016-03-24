require "rails_helper"

feature "user may create a project" do
  # As a user
  # I want to create a project
  # So that I can remember to work on it later
  #
  # Acceptance Criteria
  #
  # [] I must provide a title
  # [] I must provide a description
  # [] If my submission is successful, I should see my project on the index page
  # [] I must be presented with errors if I fill out the form incorrectly

  scenario "index page has a button to add a new project" do
    visit projects_path

    expect(page).to have_link "Add a new project"
  end

  scenario "user successfully adds a new project" do
    visit projects_path
    click_link "Add a new project"

    expect(page).to have_content "Title"

    fill_in "Title", with: "Fix the zipper on these boots"
    fill_in "Description", with: "No seriously this is bad they're going to break."
    fill_in "GitHub", with: "http://boots.com"
    click_button "Submit project"

    expect(page).to have_content "Fix the zipper on these boots"
  end

  scenario "user submits a project with missing information" do
    visit projects_path
    click_link "Add a new project"

    expect(page).to have_content "Title"

    fill_in "Title", with: "Fix the zipper on these boots"
    click_button "Submit project"

    expect(page).to have_content "Please make sure all fields are filled in!"
  end
end
