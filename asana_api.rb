# frozen_string_literal: true

require 'uri'
require 'json'
require 'net/http'

class AsanaApi
  API_ENDPOINT = 'https://app.asana.com/api/1.0/'
  TOKEN = '1/1204892460316154:9d9c0f18d242721303ed8511113d5e11'

  class << self
    # Method to create project which have require following params
    # data: Hash, team: uniq team ID, current_status: Hash of reuired project params like title, text and etc. 
    def create_project(params)
      url = get_url('projects')

      get_response(url, post_request(url), params)
    end

    # Method to create section for any project which have require following params
    # project_gid: project ID (mandatory), name: section name(mandatory).
    def create_section(project_gid, params)
      url = get_url("projects/#{project_gid}/sections")

      get_response(url, post_request(url), params)
    end

    # Method to find section any section using section_gid
    # section_gid: Section ID (mandatory).
    def get_section(section_gid)
      url = get_url("sections/#{section_gid}")

      get_response(url, get_request(url))
    end

    # Method to get all workspaces.
    def get_workspaces
      url = get_url('workspaces')

      get_response(url, get_request(url))
    end

    # Method to create task for any workspace which have require following params
    # workspace: project ID (mandatory), name: task name and any other params.
    def create_task(params)
      url = get_url('tasks')

      get_response(url, post_request(url), params)
    end

    # Method to update task recently created task which have require following params
    # workspace: project ID (mandatory), name: task name and any other params.
    def update_task(task_gid, params)
      url = get_url("tasks/#{task_gid}")

      request = Net::HTTP::Put.new(url)
      get_response(url, request, params)
    end

    protected

    def get_url(end_point)
      URI("#{API_ENDPOINT}#{end_point}")
    end

    def get_request(url)
      Net::HTTP::Get.new(url)
    end

    def post_request(url)
      Net::HTTP::Post.new(url)
    end

    def get_response(url, request, params = {})
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request['Authorization'] = "Bearer #{TOKEN}"
      request['Content-Type'] = 'application/json'
      request.body = JSON.dump(params)

      response = https.request(request)

      { data: JSON.parse(response.body), message: response.message, status_code: response.code }
    end
  end
end

p AsanaApi.get_section(1204894009803251)