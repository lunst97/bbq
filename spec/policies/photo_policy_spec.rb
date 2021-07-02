require 'rails_helper'

RSpec.describe PhotoPolicy, type: :policy do
  let(:user_1) { FactoryBot.create(:user) }
  let(:user_2) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event, user: user_1) }
  let(:event_pin) { FactoryBot.create(:event, user: user_2, pincode: '12345') }
  let(:pincode_cookies) { { "events_#{event_with_pincode.id}_pincode" => '12345' } }

  subject { described_class }

  permissions :destroy? do
    let(:user_sub) { UserContext.new(user_1, {}) }
    let(:user_unsub) { UserContext.new(user_2, {}) }
    it {is_expected.to permit(user_sub, event)}
    it {is_expected.not_to permit(user_unsub, event)}
  end

  permissions :create? do
    let(:user_sub) { UserContext.new(user_1, {}) }
    let(:user_unsub_pin) { UserContext.new(user_2, pincode_cookies) }
    let(:user_unsub) { UserContext.new(user_2, {}) }
    it {is_expected.not_to permit(user_unsub, event)}
    it {is_expected.to permit(user_sub, event)}
    it {is_expected.not_to permit(user_unsub_pin, event_pin)}
  end
end
