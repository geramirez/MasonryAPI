require 'rails_helper'
require 'support/factory_girl'

RSpec.describe 'Components API' do
  describe '/api/v1/components' do

    let(:test_component) { FactoryGirl.create(:component) }
    let(:base_url) { '/api/v1/components' }

    it 'returns a list of components' do
      get base_url
      json = JSON.parse(response.body)
      expect(json['components']).not_to be_empty
    end

    it 'returns a list of components with name data' do
      get base_url
      json = JSON.parse(response.body)
      expect(json['components'][0]['name']).to eq('Audit Policy')
    end

    describe '/api/v1/component/:id/' do
      it 'returns name, key, and documentation_complete' do
        get base_url + "/#{test_component.id}"
        json = JSON.parse(response.body)
        expect(json['name']).to eq('Audit Policy')
        expect(json['key']).to eq('Audit-Policy')
        expect(json['documentation_complete']).to be true
      end
    end

    context 'references' do

      before(:all) { FactoryGirl.create(:reference) }

      describe '/api/v1/component/:id/references' do
        it 'returns a list of references' do
          get base_url + "/#{test_component.id}/references/"
          json = JSON.parse(response.body)
          expect(json['references']).to_not be_empty
        end
      end

      describe '/api/v1/component/:id/references/:id' do
        it 'returns a single reference' do
          get base_url + \
            "/#{test_component.id}/references/#{test_component.references.first.id}/"
          json = JSON.parse(response.body)
          expect(json['name']).to eq('AU Policy')
          expect(json['path']).to eq('https://github.com/opencontrol/freedonia-policies/wiki/Audit-Policy')
          expect(json['kind']).to eq('URL')
        end
      end
    end
  end
end
