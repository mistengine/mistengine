require 'spec_helper'

describe User do
  describe 'validations' do
    subject { FactoryGirl.build(:user) }
    it 'requires a name' do
      subject.name = nil
      subject.should_not be_valid
    end
    it 'requires a password' do
      subject.password = nil
      subject.should_not be_valid
    end
    it 'requires an email' do
      subject.email = nil
      subject.should_not be_valid
    end
    it 'requires a name' do
      subject.name = nil
      subject.should_not be_valid
    end
    it 'requires a group' do
      subject.groups = []
      subject.should_not be_valid
    end
  end

  it 'has articles' do
    article = FactoryGirl.create(:article)
    user = article.users.to_a.first

    user.should be_a User
    user.articles.should include(article)
  end

  describe 'groups' do
    it 'has at least one group' do
      user = FactoryGirl.create(:user)
      user.groups.should_not be_nil
      user.groups.length.should == 1
    end
    it 'may have more than one group' do
      groups = FactoryGirl.create_list(:group, 2)
      user = FactoryGirl.create(:user, groups: groups)
      user.groups.should_not be_nil
      user.groups.length.should == 2
    end

    describe 'permissions' do
      it 'comes from my group' do
        user = FactoryGirl.create(:user)
        group = user.groups.first
        user.permissions.should_not be_nil
        user.permissions.should == {
          "admin" => {
            'can_view_admincp' => "1"
          },
          "articles" => {
            'can_create_articles' => "0",
            'can_edit_articles' => "0"
          }
        }
      end

      it 'is overridden by positive groups' do
        groups = FactoryGirl.create_list(:group, 2)
        groups.second.update_attribute(:permissions, {
          "admin" => {
            'can_view_admincp' => "1"
          },
          "articles" => {
            'can_create_articles' => "0",
            'can_edit_articles' => "1"
          }
        })

        user = FactoryGirl.create(:user, groups: groups)
        user.permissions.should == {
          "admin" => {
            'can_view_admincp' => "1"
          },
          "articles" => {
            'can_create_articles' => "0",
            'can_edit_articles' => "1"
          }
        }
      end

      describe '#can?' do
        subject { FactoryGirl.create(:user) }
        it 'returns true if a user can do something' do
          subject.can?('admin.view_admincp').should be_true
        end
        it 'returns false if a user cannot do something' do
          subject.can?('aricles.create_articles').should be_false
        end
      end

      describe '#cannot?' do
        subject { FactoryGirl.create(:user) }
        it 'returns true if a user cannot do something' do
          subject.cannot?('articles.create_articles').should be_true
        end
        it 'returns false if a user can do something' do
          subject.cannot?('admin.view_admincp').should be_false
        end
      end
    end
  end
end
