require 'test_helper'

module News
  class RelatedLinksControllerTest < ActionController::TestCase
    setup do
      @related_link = related_links(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:related_links)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create related_link" do
      assert_difference('RelatedLink.count') do
        post :create, related_link: {  }
      end
  
      assert_redirected_to related_link_path(assigns(:related_link))
    end
  
    test "should show related_link" do
      get :show, id: @related_link
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @related_link
      assert_response :success
    end
  
    test "should update related_link" do
      put :update, id: @related_link, related_link: {  }
      assert_redirected_to related_link_path(assigns(:related_link))
    end
  
    test "should destroy related_link" do
      assert_difference('RelatedLink.count', -1) do
        delete :destroy, id: @related_link
      end
  
      assert_redirected_to related_links_path
    end
  end
end
