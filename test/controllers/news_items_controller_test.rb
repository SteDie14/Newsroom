require 'test_helper'

class NewsItemsControllerTest < ActionController::TestCase
  setup do
    @news_item = news_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:news_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create news_item" do
    assert_difference('NewsItem.count') do
      post :create, news_item: { RssSource_id: @news_item.RssSource_id, comment: @news_item.comment, doc_url: @news_item.doc_url, headline: @news_item.headline, keywords: @news_item.keywords, release_date: @news_item.release_date, topic: @news_item.topic, vendor: @news_item.vendor, web_url: @news_item.web_url }
    end

    assert_redirected_to news_item_path(assigns(:news_item))
  end

  test "should show news_item" do
    get :show, id: @news_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @news_item
    assert_response :success
  end

  test "should update news_item" do
    patch :update, id: @news_item, news_item: { RssSource_id: @news_item.RssSource_id, comment: @news_item.comment, doc_url: @news_item.doc_url, headline: @news_item.headline, keywords: @news_item.keywords, release_date: @news_item.release_date, topic: @news_item.topic, vendor: @news_item.vendor, web_url: @news_item.web_url }
    assert_redirected_to news_item_path(assigns(:news_item))
  end

  test "should destroy news_item" do
    assert_difference('NewsItem.count', -1) do
      delete :destroy, id: @news_item
    end

    assert_redirected_to news_items_path
  end
end
