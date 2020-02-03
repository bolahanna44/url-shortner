# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'validations' do
    it 'should not be valid if no link is provided' do
      expect(build(:link, original_url: nil)).not_to be_valid
    end

    it 'should not be valid if provided link not valid link' do
      expect(build(:link, original_url: 'test string')).not_to be_valid
    end

    it 'should not be valid if provided link is empty string' do
      expect(build(:link, original_url: '')).not_to be_valid
    end

    it 'should be valid if link is provided' do
      expect(build(:link)).to be_valid
    end
  end

  describe 'callbacks' do
    it 'should generate short link after creation' do
      link = create(:link)
      expect(link.short_url).not_to be_blank
    end
  end
end
