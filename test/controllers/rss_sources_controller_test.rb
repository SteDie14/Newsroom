require 'test_helper'

class RssSourcesControllerTest < ActionController::TestCase
  setup do
    @rss_source = rss_sources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rss_sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rss_source" do
    assert_difference('RssSource.count') do
      post :create, rss_source: { title: @rss_source.title, url: @rss_source.url }
    end

    assert_redirected_to rss_source_path(assigns(:rss_source))
  end

  test "should show rss_source" do
    get :show, id: @rss_source
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rss_source
    assert_response :success
  end

  test "should update rss_source" do
    patch :update, id: @rss_source, rss_source: { title: @rss_source.title, url: @rss_source.url }
    assert_redirected_to rss_source_path(assigns(:rss_source))
  end

  test "should destroy rss_source" do
    assert_difference('RssSource.count', -1) do
      delete :destroy, id: @rss_source
    end

    assert_redirected_to rss_sources_path
  end
end
