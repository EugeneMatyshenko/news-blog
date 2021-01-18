require 'rails_helper'

RSpec.describe User, type: :model do

  context "validation test" do
    it 'ensures first name presence' do
      user = User.new(first_name: 'First').save
      expect(user).to eq(false)
    end

    it 'ensures last name presence' do
      user = User.new(last_name: 'Last').save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(first_name: 'First', last_name: 'Last').save
      expect(user).to eq(true)
    end
  end

  context 'scope test' do
    let (:params) { { first_name: nil, last_name: 'Last' } }
    before(:each) do
      User.new(params).save!
      User.new(params).save!
      User.new(params).save!
      User.new(params.merge(active: false)).save!
      User.new(params.merge(active: false)).save!
    end

    it 'should return active users' do
      expect(User.active_users.size).to eq(3)
    end

    it 'should return inactive users' do
      binding.pry
      expect(User.inactive_users.size).to eq(2)
    end
  end

end
