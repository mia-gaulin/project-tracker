project1 = Project.create!(title: "Project tracker", description: "An app to keep track of all the projects I want to build.", github_link: "https://github.com/mia-gaulin/project-tracker")

feature1 = Feature.create!(body: "It should be able to keep track of the name and description of the project, as well as features I think of as I go along", project: project1)
