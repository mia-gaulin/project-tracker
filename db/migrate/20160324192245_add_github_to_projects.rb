class AddGithubToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :github_link, :string, null: false
  end
end
