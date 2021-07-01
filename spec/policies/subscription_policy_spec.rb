require 'rails_helper'

RSpec.describe SubscriptionPolicy, type: :policy do
  let(:user_1) { FactoryBot.create(:user) }
  let(:user_2) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event, user: user_1) }
  let(:event_pin) { FactoryBot.create(:event, user: user_2, pincode: '12345') }
  let(:pincode_cookies) { { "events_#{event_with_pincode.id}_pincode" => '12345' } }

  subject { described_class }

  permissions :destroy? do
    let(:user_q) { UserContext.new(user_1, {}) }
    let(:user_z) { UserContext.new(user_2, {}) }
    it {is_expected.to permit(user_q, event)}
    it {is_expected.not_to permit(user_z, event)}
  end

  permissions :create? do
    let(:user_q) { UserContext.new(user_1, {}) }
    let(:user_pin) { UserContext.new(user_1, pincode_cookies) }
    let(:user_z) { UserContext.new(user_2, {}) }
    it {is_expected.to permit(user_q, event)}
    it {is_expected.to permit(user_z, event)}
    it {is_expected.not_to permit(user_q, event_pin)}
    it {is_expected.to permit(user_pin, event_pin)}
  end
end
