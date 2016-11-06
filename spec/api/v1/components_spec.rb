require 'rails_helper'
require 'support/factory_girl'

RSpec.describe 'Components API' do
  describe '/api/v1/components' do

    let(:test_component) { FactoryGirl.create(:component) }
    let(:base_url) { '/api/v1/components' }
    let(:json_response) do
      JSON.parse(response.body)
    end

    it 'returns a list of components' do
      get base_url
      expect(json_response['components']).not_to be_empty
    end

    it 'returns a list of components with name data' do
      get base_url
      expect(json_response['components'][0]['name']).to eq('Audit Policy')
    end

    describe '/api/v1/component/:id/' do
      it 'returns name, key, and documentation_complete' do
        get base_url + "/#{test_component.id}"
        expect(json_response['name']).to eq('Audit Policy')
        expect(json_response['key']).to eq('Audit-Policy')
        expect(json_response['documentation_complete']).to be true
      end
    end

    context 'references' do
      before(:all) { FactoryGirl.create(:reference) }

      describe '/api/v1/component/:id/references' do
        it 'returns a list of references' do
          get base_url + "/#{test_component.id}/references/"
          expect(json_response['references']).to_not be_empty
        end
      end

      describe '/api/v1/component/:id/references/:id' do
        it 'returns a single reference' do
          references_path = "/#{test_component.id}/references/#{test_component.references.first.id}/"
          get base_url + references_path
          expect(json_response['name']).to eq('AU Policy')
          expect(json_response['path']).to eq('https://github.com/opencontrol/freedonia-policies/wiki/Audit-Policy')
          expect(json_response['kind']).to eq('URL')
        end
      end
    end

    context 'verifications' do
      before(:all) { FactoryGirl.create(:verification) }

      describe '/api/v1/component/:id/verifications' do
        it 'returns a list of verifications' do
          get base_url + "/#{test_component.id}/verifications/"
          expect(json_response['verifications']).to_not be_empty
        end
      end

      describe '/api/v1/component/:id/verifications/:id' do
        it 'returns a single verification' do
          verifications_path = "/#{test_component.id}/verifications/#{test_component.verifications.first.id}/"
          get base_url + verifications_path
          expect(json_response['name']).to eq('AU Validation')
          expect(json_response['key']).to  eq('au-validation')
          expect(json_response['path']).to eq('https://github.com/opencontrol/freedonia-policies/wiki/Audit-Policy')
          expect(json_response['kind']).to eq('URL')
        end
      end

    end

  end
end
