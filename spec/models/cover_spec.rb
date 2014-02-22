require 'spec_helper'

describe Cover do
  subject { FactoryGirl.build(:cover) }
  it 'validates presence of article or url' do
    original_aid = subject.article_id

    subject.article_id = nil
    subject.url = nil
    subject.should_not be_valid

    subject.article_id = original_aid
    subject.should be_valid

    subject.article_id = nil
    subject.url = Faker::Internet.url
    subject.title = Faker::Lorem.words
    subject.description = Faker::Lorem.sentence
    subject.should be_valid
  end

  describe 'when a url is present' do
    it 'validates presence of title and description' do
      subject.url = Faker::Internet.url
      subject.title = nil
      subject.description = nil

      subject.should_not be_valid
    end
  end

  describe '.active' do
    it 'returns valid, active cover stories' do
      subject.active = true
      subject.save!

      inactive = FactoryGirl.create(:cover, active: false)

      Cover.active.should include(subject)
      Cover.active.should_not include(inactive)
    end
  end

  describe '.front_page' do
    it 'returns the highest weighted, last 3 active cover stories' do
      there = FactoryGirl.create(:cover, active: true)
      not_there = FactoryGirl.create(:cover, active: false)
      also_there = FactoryGirl.create_list(:cover, 2, weight: 1)
      still_not_there = FactoryGirl.create(:cover, active: true, weight: 2)

      returned = Cover.front_page
      returned.should include(there)
      also_there.each do |cover|
        returned.should include(cover)
      end
      returned.should_not include(not_there)
      returned.should_not include(still_not_there)
    end
  end

  describe '#sweep_cache' do
    it 'is triggered when a cover story is saved' do
      Cover.any_instance.stub(:sweep_cache).and_return(true)
      Cover.any_instance.should_receive(:sweep_cache)
      subject.save!
    end
  end
end
