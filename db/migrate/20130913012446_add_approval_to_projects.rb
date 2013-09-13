class AddApprovalToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :approval, :boolean
  end
end
