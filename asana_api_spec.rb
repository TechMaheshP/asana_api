# frozen_string_literal: true

require 'rspec'
require 'webmock/rspec'
require_relative 'asana_api'

describe AsanaApi do
  let(:describe) { AsanaApi }
  let(:api_endpoint) { 'https://app.asana.com/api/1.0/' }

  before do
    allow(AsanaApi).to receive(:get_response).with(url, an_instance_of(request), params).and_return({ message: 'ok' })
  end

  describe 'create_project' do
    let(:url) { URI("#{api_endpoint}projects") }
    let(:request) { Net::HTTP::Post }
    let(:params) do
      {
        "data": {
          "current_status": {
            "text": 'The project is moving forward according to plan...',
            "title": 'Status Update - Jun 15'
          },
          "team": '1204892461522561'
        }
      }
    end

    it 'create projects' do
      response = describe.create_project(params)
      expect(response[:message]).to eq('ok')
    end
  end

  describe 'create_section' do
    let(:project_gid) { '4672398742434698' }
    let(:url) { URI(api_endpoint + "projects/#{project_gid}/sections") }
    let(:request) { Net::HTTP::Post }
    let(:params) do
      {
        "data": {
          "name": 'Next Actions'
        }
      }
    end

    it 'create section' do
      response = describe.create_section(project_gid, params)
      expect(response[:message]).to eq('ok')
    end
  end

  describe 'get_section' do
    let(:section_gid) { '5487975649875474' }
    let(:url) { URI(api_endpoint + "sections/#{section_gid}") }
    let(:request) { Net::HTTP::Get }
    let(:params) { {} }

    it 'get section' do
      response = describe.get_section(section_gid)
      expect(response[:message]).to eq('ok')
    end
  end

  describe 'get_workspaces' do
    let(:url) { URI("#{api_endpoint}workspaces") }
    let(:request) { Net::HTTP::Get }
    let(:params) { {} }

    it 'get workspaces' do
      response = describe.get_workspaces
      expect(response[:message]).to eq('ok')
    end
  end

  describe 'create_task' do
    let(:url) { URI("#{api_endpoint}tasks") }
    let(:request) { Net::HTTP::Post }
    let(:params) do
      {
        "data": {
          "name": 'Test Task'
        }
      }
    end

    it 'create task' do
      response = describe.create_task(params)
      expect(response[:message]).to eq('ok')
    end
  end

  describe 'update_task' do
    let(:task_gid) { '4564678456487686' }
    let(:url) { URI(api_endpoint + "tasks/#{task_gid}") }
    let(:request) { Net::HTTP::Put }
    let(:params) do
      {
        "data": {
          "name": 'Updated Task'
        }
      }
    end

    it 'create section' do
      response = describe.update_task(task_gid, params)
      expect(response[:message]).to eq('ok')
    end
  end
end
