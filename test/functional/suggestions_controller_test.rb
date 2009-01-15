require File.dirname(__FILE__) + '/../test_helper'

class SuggestionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:suggestions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_suggestion
    assert_difference('Suggestion.count') do
      post :create, :suggestion => { }
    end

    assert_redirected_to suggestion_path(assigns(:suggestion))
  end

  def test_should_show_suggestion
    get :show, :id => suggestions(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => suggestions(:one).id
    assert_response :success
  end

  def test_should_update_suggestion
    put :update, :id => suggestions(:one).id, :suggestion => { }
    assert_redirected_to suggestion_path(assigns(:suggestion))
  end

  def test_should_destroy_suggestion
    assert_difference('Suggestion.count', -1) do
      delete :destroy, :id => suggestions(:one).id
    end

    assert_redirected_to suggestions_path
  end
end
