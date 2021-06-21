require 'rails_helper'

RSpec.describe SubscriptionPolicy, type: :policy do
  let(:user_1) { FactoryBot.create(:user) }
  let(:user_2) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event, user: user_1) }

  subject { described_class }

  permissions :destroy? do
    let(:user_q) { UserContext.new(user_1, {}) }
    let(:user_z) { UserContext.new(user_2, {}) }
    it {is_expected.to permit(user_q, event)}
    it {is_expected.not_to permit(user_z, event)}
  end

  permissions :create? do
    let(:user_q) { UserContext.new(user_1, {}) }
    let(:user_z) { UserContext.new(user_2, {}) }
    it {is_expected.to permit(user_q, event)}
    it {is_expected.to permit(user_z, event)}
  end
end
