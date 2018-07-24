describe GroupEventsController, type: :controller do
  describe 'GET index' do
    let(:group_event) { create(:group_event) }
    let(:group_event_delete) { create(:group_event) }
    it 'assigns @group_events' do
      get :index
      expect(assigns(:group_events)).to eq([group_event])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    context 'delete group_event but still show in the index' do
      it 'assigns group_event_delete to @group_events' do
        group_event_delete.destroy
        get :index
        expect(assigns(:group_events)).to eq([group_event_delete])
      end
    end
  end

  describe 'GET show' do
    let(:group_event) { create(:group_event) }
    it 'assigns @group_event' do
      get :show, params: { id: group_event.id }
      expect(assigns(:group_event)).to eq(group_event)
    end

    it 'renders the show template' do
      get :show, params: { id: group_event.id }
      expect(response).to render_template('show')
    end
  end

  describe 'POST create' do
    it 'creates a new group_event' do
      expect{
        post :create, params: { group_event: attributes_for(:group_event) }
      }.to change(GroupEvent,:count).by(1)
    end

    it 'redirects to the new group_event' do
      post :create, params: { group_event: attributes_for(:group_event) }
      response.should redirect_to GroupEvent.last
    end
  end

  describe 'POST update' do
    let(:group_event) { create(:group_event) }

    it 'located the requested @group_event' do
      put :update, params: { id: group_event.id , group_event: attributes_for(:full_group_event) }
      assigns(:group_event).should eq(group_event)
    end

    it 'complete the attributes for @group_event' do
      put :update, params: { id: group_event.id , group_event: attributes_for(:full_group_event) }
      assigns(:group_event).should eq(group_event)
      expect(group_event.name).not_to be_nil
      expect(group_event.description).not_to be_nil
      expect(group_event.location).not_to be_nil
    end

    it 'redirects to the updated group_event' do
      put :update, params: { id: group_event.id , group_event: attributes_for(:full_group_event) }
      response.should redirect_to group_event
    end
  end

  describe 'POST delete' do
    let(:group_event) { create(:group_event) }

    it 'deletes the group_event' do
      expect{
        delete :destroy, params: { id: group_event.id }
      }.to change(GroupEvent,:count).by(0)
    end
      
    it 'redirects to group_event#index' do
      delete :destroy, params: { id: group_event.id }
      response.should redirect_to group_events_url
    end

    it 'assigns @group_events' do
      get :index
      expect(assigns(:group_events)).to eq([group_event])
    end
  end

  describe 'PATCH published' do
    let(:group_event) { create(:group_event) }
    let(:full_group_event) { create(:full_group_event) }

    it 'do not publish event without full data' do
      patch :published, params: { group_event_id: group_event.id }
      expect(group_event.published).to be false
    end

    it 'publish event with full data' do
      patch :published, params: { group_event_id: full_group_event.id }
      expect(GroupEvent.find(full_group_event.id).published).to be true
    end
  end
end
