# asana_api

First you have to create asana account `https://app.asana.com/` and create a barear token which you have to repace with constant variabel `TOKEN` in to the `asana_api.rb` file. Than you have to create Team on asana and get your team ID which is mandatory for create project.

## Create Project

I have created `create_project` to create project: 
 
	`AsanaApi.create_project(params)`

#### Request Parameters
	params = {
	   "data": {
	     "current_status": {
	       "color": "yellow",
	       "text": "The project is moving forward according to plan...",
	       "html_text": "<body>The project <strong>is</strong> moving forward according to plan...</body>",
	       "title": "Status Update - Jun 15"
	     },
	     "team": "enter your team ID"
	   }
	 }

 #### Response
 	{:data=>{"data"=>{"gid"=>"1204936266688396", "resource_type"=>"project", "created_at"=>"2023-06-29T13:55:35.551Z", "modified_at"=>"2023-06-29T13:55:36.033Z", "due_date"=>nil, "due_on"=>nil, "public"=>true, "name"=>"", "notes"=>"", "archived"=>false, "workspace"=>{"gid"=>"1204892461522559", "resource_type"=>"workspace", "name"=>"My workspace"}, "team"=>{"gid"=>"1204892461522561", "resource_type"=>"team", "name"=>"My workspace"}, "default_view"=>"list", "start_on"=>nil, "completed"=>false, "completed_at"=>nil, "completed_by"=>nil, "owner"=>{"gid"=>"1204892460316154", "resource_type"=>"user", "name"=>"Mahesh"}, "permalink_url"=>"https://app.asana.com/0/1204936266688396/1204936266688396", "members"=>[{"gid"=>"1204892460316154", "resource_type"=>"user", "name"=>"Mahesh"}], "current_status_update"=>{"gid"=>"1204936266688412", "resource_type"=>"status_update", "title"=>"Status Update - Jun 29"}, "color"=>nil, "icon"=>"list", "followers"=>[{"gid"=>"1204892460316154", "resource_type"=>"user", "name"=>"Mahesh"}], "custom_fields"=>[], "custom_field_settings"=>[], "current_status"=>{"gid"=>"1204936266688412", "title"=>"Status Update - Jun 29", "color"=>"yellow", "text"=>"The project is moving forward according to plan...", "created_at"=>"2023-06-29T13:55:36.023Z", "modified_at"=>"2023-06-29T13:55:36.023Z", "created_by"=>{"gid"=>"1204892460316154", "resource_type"=>"user", "name"=>"Mahesh"}, "author"=>{"gid"=>"1204892460316154", "resource_type"=>"user", "name"=>"Mahesh"}}}}, :message=>"Created", :status_code=>"201"}

## Create Section

I have created `create_section` to create section: 

`AsanaApi.create_section(project_gid, params)`

#### Request Parameters
	params = {
	  "data": {
	    "name": "Next Actions"
	  }
	}

#### Response
	{:data=>{"data"=>{"gid"=>"1204936281500095", "resource_type"=>"project", "created_at"=>"2023-06-29T13:59:07.672Z", "modified_at"=>"2023-06-29T13:59:08.222Z", "due_date"=>nil, "due_on"=>nil, "public"=>true, "name"=>"", "notes"=>"", "archived"=>false, "workspace"=>{"gid"=>"1204892461522559", "resource_type"=>"workspace", "name"=>"My workspace"}, "team"=>{"gid"=>"1204892461522561", "resource_type"=>"team", "name"=>"My workspace"}, "default_view"=>"list", "start_on"=>nil, "completed"=>false, "completed_at"=>nil, "completed_by"=>nil, "owner"=>{"gid"=>"1204892460316154", "resource_type"=>"user", "name"=>"Mahesh"}, "permalink_url"=>"https://app.asana.com/0/1204936281500095/1204936281500095", "members"=>[{"gid"=>"1204892460316154", "resource_type"=>"user", "name"=>"Mahesh"}], "current_status_update"=>{"gid"=>"1204936281500111", "resource_type"=>"status_update", "title"=>"Status Update - Jun 29"}, "color"=>nil, "icon"=>"list", "followers"=>[{"gid"=>"1204892460316154", "resource_type"=>"user", "name"=>"Mahesh"}], "custom_fields"=>[], "custom_field_settings"=>[], "current_status"=>{"gid"=>"1204936281500111", "title"=>"Status Update - Jun 29", "color"=>"yellow", "text"=>"The project is moving forward according to plan...", "created_at"=>"2023-06-29T13:59:08.211Z", "modified_at"=>"2023-06-29T13:59:08.211Z", "created_by"=>{"gid"=>"1204892460316154", "resource_type"=>"user", "name"=>"Mahesh"}, "author"=>{"gid"=>"1204892460316154", "resource_type"=>"user", "name"=>"Mahesh"}}}}, :message=>"Created", :status_code=>"201"}

## Get Section

I have created `get_section` to find a section: 

`AsanaApi.get_section(section_gid)`

#### Response
	{:data=>{"data"=>{"gid"=>"1204894009803251", "created_at"=>"2023-06-23T20:10:26.951Z", "name"=>"Next Section", "project"=>{"gid"=>"1204892377662438", "name"=>"Cross-functional project plan", "resource_type"=>"project"}, "resource_type"=>"section"}}, :message=>"OK", :status_code=>"200"}

## Get Workspaces

I have created `get_workspaces` to get all workspaces: 

`AsanaApi.get_workspaces`

#### Response
	{:data=>{"data"=>{"gid"=>"1204894009803251", "created_at"=>"2023-06-23T20:10:26.951Z", "name"=>"Next Section", "project"=>{"gid"=>"1204892377662438", "name"=>"Cross-functional project plan", "resource_type"=>"project"}, "resource_type"=>"section"}}, :message=>"OK", :status_code=>"200"}


## Create Task

I have created `create_task` to create task: 

`AsanaApi.create_task(params)`

#### Request Parameters
	params = {
	   "data": {
	   		"workspace": workspace_gid,
	     	"name": "Task name"
	    }
	}

#### Response
	{:data=>{"data"=>{"gid"=>"1204936790966890", "projects"=>[], "memberships"=>[], "resource_type"=>"task", "created_at"=>"2023-06-29T14:08:55.948Z", "modified_at"=>"2023-06-29T14:08:56.026Z", "name"=>"Task name", "notes"=>"", "assignee"=>nil, "parent"=>nil, "actual_time_minutes"=>0, "completed"=>false, "completed_at"=>nil, "due_on"=>nil, "due_at"=>nil, "resource_subtype"=>"default_task", "start_on"=>nil, "start_at"=>nil, "tags"=>[], "workspace"=>{"gid"=>"1204892461522559", "resource_type"=>"workspace", "name"=>"My workspace"}, "num_hearts"=>0, "num_likes"=>0, "hearts"=>[], "likes"=>[], "assignee_status"=>"upcoming", "hearted"=>false, "liked"=>false, "permalink_url"=>"https://app.asana.com/0/1204892461522573/1204936790966890", "followers"=>[{"gid"=>"1204892460316154", "resource_type"=>"user", "name"=>"Mahesh"}], "custom_fields"=>[]}}, :message=>"Created", :status_code=>"201"}



## Update Task

I have created `update_task` to update task: 

`AsanaApi.update_task(task_gid, params)`

#### Request Parameters
	params = {
	   "data": {
	     	"name": "Update Task name"
	    }
	}

#### Response
	{:data=>{"data"=>{"gid"=>"1204915313884890", "projects"=>[], "memberships"=>[], "resource_type"=>"task", "created_at"=>"2023-06-27T10:11:18.002Z", "modified_at"=>"2023-06-29T14:10:52.713Z", "name"=>"update task name", "notes"=>"", "assignee"=>nil, "parent"=>nil, "actual_time_minutes"=>0, "completed"=>false, "completed_at"=>nil, "due_on"=>nil, "due_at"=>nil, "resource_subtype"=>"default_task", "start_on"=>nil, "start_at"=>nil, "tags"=>[], "workspace"=>{"gid"=>"1204892461522559", "resource_type"=>"workspace", "name"=>"My workspace"}, "num_hearts"=>0, "num_likes"=>0, "hearts"=>[], "likes"=>[], "hearted"=>false, "liked"=>false, "assignee_status"=>"upcoming", "permalink_url"=>"https://app.asana.com/0/1204892461522573/1204915313884890", "followers"=>[{"gid"=>"1204892460316154", "resource_type"=>"user", "name"=>"Mahesh"}], "custom_fields"=>[]}}, :message=>"OK", :status_code=>"200"}
