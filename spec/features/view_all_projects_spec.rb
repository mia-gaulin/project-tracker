require "rails_helper"

feature "user may view a list of all side projects" do
  # As a user
  # I want to view a list of all my side projects
  # So I can figure out what to work on next
  #
  # Acceptance Criteria
  #
  # [x] I must be on the index page
  # [x] I must see the title of each project
  # [x] The project with most recent activity should be listed first

  scenario "user views full list of side projects" do
    project = FactoryGirl.create(:project)

    visit projects_path

    expect(page).to have_content project.title
  end

  scenario "project with most recent activity is listed first" do
    project1 = FactoryGirl.create(:project)
    project2 = FactoryGirl.create(:project,title: "This is a different project")
    project3 = FactoryGirl.create(:project,title: "And another")
    project4 = FactoryGirl.create(:project,title: "And one more for good measure")

    visit projects_path

    expect(project4.title).to appear_before(project1.title)
  end
end
