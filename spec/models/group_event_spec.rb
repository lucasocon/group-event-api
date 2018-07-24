describe GroupEvent, type: :model do
  it 'has a valid factory' do
    expect(build(:group_event)).to be_valid
  end

  context 'calculate' do
    let(:group_event) { create(:group_event) }

    it 'duration not be nil' do
      expect(group_event.duration).not_to be_nil
    end
  end

  context 'published the events' do
    describe '.published_event' do
      let(:simple_group_event) { create(:simple_group_event) }
      let(:full_group_event) { create(:full_group_event) }

      it 'get an error, the field should be full' do
        expect(simple_group_event.published_event).to be_nil
      end

      it 'published events' do
        expect(full_group_event.published_event).to be true
      end
    end
  end

  context 'soft delete' do
    describe '.published_event' do
      let(:simple_group_event) { create(:simple_group_event) }
      let(:simple_group_event_delete) { create(:simple_group_event) }

      it 'should delete event, and update deleted_at field' do
        expect(simple_group_event.deleted_at).to be_nil
        expect(simple_group_event.destroy).to be simple_group_event
        expect(simple_group_event.deleted_at).not_to be_nil
      end

      it 'does not should update delete event' do
        simple_group_event_delete.destroy
        expect{ simple_group_event_delete.update!(name: Faker::Name.name)}.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
