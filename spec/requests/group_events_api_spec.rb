describe Api::V1::GroupEventsController, type: :request do

  describe 'GET index' do
    it 'returns all group_event' do
      create_list(:group_event, 10)

      get '/api/v1/group_events'
      expect(json_response.size).to eq(10)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST create' do
    it 'new group_event' do
      post '/api/v1/group_events', params: { group_event: attributes_for(:group_event) }
      expect(json_response[:name]).to_not be_nil
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH update' do
    let(:group_event) { create(:group_event) }
    it 'update event group' do
      patch "/api/v1/group_events/#{group_event.id}", params: { group_event: { name: 'new_name' } }
      expect(json_response[:name]).to eq('new_name')
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE update' do
    let(:group_event) { create(:group_event) }
    it 'delete event group but should get it in index' do
      delete "/api/v1/group_events/#{group_event.id}"
      expect(response).to have_http_status(204)
    end

    it 'returns group_event deleted' do
      get '/api/v1/group_events'
      expect(json_response.size).to eq(0)
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH published' do
    let(:group_event) { create(:group_event) }
    let(:full_group_event) { create(:full_group_event) }
    it 'not should published because it has not full data' do
      patch "/api/v1/group_events/#{group_event.id}/published"
      expect(json_response[:published]).to eq(false)
      expect(response).to have_http_status(200)
    end

    it 'should be published the group event' do
      patch "/api/v1/group_events/#{full_group_event.id}/published"
      expect(json_response[:published]).to eq(true)
      expect(response).to have_http_status(200)
    end
  end
end
