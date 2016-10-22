require 'rails_helper'

RSpec.describe 'Components API' do
  describe '/api/v1/components' do

    let(:base_url) { '/api/v1/components' }

    before(:each) do
      Component.create(name: 'test', key: 'key', documentation_complete: 'partial')
    end

    it 'returns a list of components' do
      get base_url
      json = JSON.parse(response.body)
      expect(json['components'].length).to eq(1)
    end

    it 'returns a list of components with names' do
      get base_url
      json = JSON.parse(response.body)
      expect(json['components'][0]['name']).to eq('test')
    end

    it 'returns a list of components with key' do
      get base_url
      json = JSON.parse(response.body)
      expect(json['components'][0]['key']).to eq('key')
    end

    it 'returns a list of components with documentation_complete' do
      get base_url
      json = JSON.parse(response.body)
      expect(json['components'][0]['documentation_complete']).to eq('partial')
    end


  end
end
