require 'rubygems'
require 'test/unit'
require 'sequel'

DB = Sequel.connect('sqlite:/')

class ItemWithPermalink < Sequel::Model
  set_schema do
    primary_key :id
    varchar :title
    varchar :link
  end
  create_table!
  is :permalinked, :link => :title
end

class ItemWithMultiplePermalinks < Sequel::Model
  set_schema do
    primary_key :id
    varchar :name
    varchar :name_link
    varchar :title
    varchar :title_link
  end
  create_table!
  is :permalinked, :title_link => :title, :name_link => :name
end

class SequelPermalinkedTest < Test::Unit::TestCase
  def test_should_create_with_permalink
    item = ItemWithPermalink.create :title => 'Default permalink'
    assert_equal 'default-permalink', item.link
  end

  def test_should_create_with_specific_permalink
    item = ItemWithPermalink.create :title => 'Explicit permalink', :link => 'explicit_permalink'
    assert_equal 'explicit_permalink', item.link
  end

  def test_should_not_overwrite_permalink_when_updating
    item = ItemWithPermalink.create :title => 'Default permalink'
    item.update :title => 'New title'
    assert_equal 'default-permalink', item.link
  end

  def test_should_allow_permalink_to_be_reset_when_updating
    item = ItemWithPermalink.create :title => 'Default permalink'
    item.update :title => 'New permalink', :link => nil
    assert_equal 'new-permalink', item.link
  end

  def test_should_create_with_multiple_permalinks
    item = ItemWithMultiplePermalinks.create :name => 'Name permalink', :title => 'Title permalink'
    assert_equal 'name-permalink', item.name_link
    assert_equal 'title-permalink', item.title_link
  end
end
