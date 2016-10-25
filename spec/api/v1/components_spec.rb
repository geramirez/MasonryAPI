require 'rails_helper'

RSpec.describe 'Components API' do
  describe '/api/v1/components' do

    let!(:test_component) do
      component = Component.create(name: 'test', key: 'key', documentation_complete: 'partial')
      component.references.create!(name: 'ref-name', path: '/ref-name', kind: 'image')
      component
    end

    let(:base_url) { '/api/v1/components' }

    it 'returns a list of components' do
      get base_url
      json = JSON.parse(response.body)
      expect(json['components']).not_to be_empty
    end

    it 'returns a list of components with name data' do
      get base_url
      json = JSON.parse(response.body)
      expect(json['components'][0]['name']).to eq('test')
    end

    describe '/api/v1/component/:id/' do
      it 'returns name, key, and documentation_complete' do
        get base_url + "/#{test_component.id}"
        json = JSON.parse(response.body)
        expect(json['name']).to eq('test')
        expect(json['key']).to eq('key')
        expect(json['documentation_complete']).to eq('partial')
      end
    end

    it 'returns a list of components with documentation_complete' do
      get base_url
      json = JSON.parse(response.body)
      expect(json['components'][0]['documentation_complete']).to eq('partial')
    end
  end
end
