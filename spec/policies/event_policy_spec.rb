require 'rails_helper'

RSpec.describe EventPolicy do
  subject { described_class }

  let(:user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event, user: user) }
  let(:event_with_pincode) { FactoryBot.create(:event, user: user, pincode: '123') }
  let(:pincode_cookies) { { "events_#{event_with_pincode.id}_pincode" => '123' } }

  describe 'user creator' do
    let(:context) { UserContext.new(user, {})}

    permissions :update?, :edit?, :destroy? do
      it { is_expected.to permit(context, event) }
    end

    permissions :show? do
      it { is_expected.to permit(context, event) }
    end
  end

  describe 'user owner' do
    let(:user_non) { FactoryBot.create(:user) }
    let(:user_dont_known_pincode) { UserContext.new(user_non, {})}
    let(:user_known_pincode) { UserContext.new(user_non, pincode_cookies) }

    permissions :update?, :edit?, :destroy? do
      it { is_expected.not_to permit(user_known_pincode, event_with_pincode) }
      it { is_expected.not_to permit(user_dont_known_pincode, event_with_pincode) }
      it { is_expected.not_to permit(user_dont_known_pincode, event)}
    end

    permissions :show? do
      it { is_expected.to permit(user_known_pincode, event_with_pincode) }
      it { is_expected.not_to permit(user_dont_known_pincode, event_with_pincode) }
      it { is_expected.to permit(user_dont_known_pincode, event)}
    end

  end

  describe 'anonymous user' do
    let(:anonymous_known_pincode) { UserContext.new(nil, pincode_cookies) }
    let(:anonymous_dont_known_pincode) { UserContext.new(nil, {}) }

    permissions :update?, :edit?, :destroy? do
      it { is_expected.not_to permit(anonymous_known_pincode, event_with_pincode) }
      it { is_expected.not_to permit(anonymous_dont_known_pincode, event_with_pincode) }
      it { is_expected.not_to permit(anonymous_dont_known_pincode, event)}
    end

    permissions :show? do
      it { is_expected.to permit(anonymous_known_pincode, event_with_pincode) }
      it { is_expected.not_to permit(anonymous_dont_known_pincode, event_with_pincode) }
      it { is_expected.to permit(anonymous_dont_known_pincode, event)}
    end
  end
end
