require "rails_helper"

feature "user may view all activity on a project" do
  # As a user
  # I want to view the activity on a project
  # So I know what I've done
  #
  # Acceptance Criteria
  #
  # [x] I must be on the project detail page
  # [x] I must only see activity for the project I'm viewing
  # [x] I must see all activity, with the most recently updated first

  scenario "view list of activity" do
    project = FactoryGirl.create(:project)
    activity = Update.create(body: "This is an update.", project: project)

    visit projects_path
    click_link project.title

    expect(page).to have_content activity.body
  end

  scenario "cannot see activity from other projects" do
    project = FactoryGirl.create(:project)
    project2 = FactoryGirl.create(:project, title: "Different project")
    activity = Update.create(body: "This is activity.", project: project)
    activity2 = Update.create(body: "This shouldn't show up.", project: project2)

    visit projects_path
    click_link project.title

    expect(page).to have_content activity.body
    expect(page).to_not have_content activity2.body
  end

  scenario "most recent activity is listed first" do
    project = FactoryGirl.create(:project)
    activity = Update.create(body: "This is activity.", project: project)
    activity2 = Update.create(body: "This should be at the top.", project: project)

    visit projects_path
    click_link project.title

    expect(activity2.body).to appear_before(activity.body)
  end
end
