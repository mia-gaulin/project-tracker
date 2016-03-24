require "rails_helper"

feature "user may view the details of a specific side project" do
  # As a user
  # I want to view a project's details
  # So that I know what to work on
  #
  # Acceptance Criteria
  #
  # [] I must be able to get to this page from the projects index
  # [] I must see the project's title
  # [] I must see the project's description

  scenario "user views side project detail page" do
    project = FactoryGirl.create(:project)

    visit projects_path

    expect(page).to have_link project.title
  end

  scenario "title and description are present on detail page" do
    project1 = FactoryGirl.create(:project)

    visit projects_path
    click_link project1.title

    expect(page).to have_content project1.title
    expect(page).to have_content project1.description
  end
end
