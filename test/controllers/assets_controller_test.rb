require 'test_helper'

class AssetsControllerTest < ActionController::TestCase
  setup do
    @asset = assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asset" do
    assert_difference('Asset.count') do
      post :create, asset: { asset_name: @asset.asset_name, asset_tag: @asset.asset_tag, cost: @asset.cost, notes: @asset.notes, purchase_date: @asset.purchase_date, serial_number: @asset.serial_number, status: @asset.status }
    end

    assert_redirected_to asset_path(assigns(:asset))
  end

  test "should show asset" do
    get :show, id: @asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asset
    assert_response :success
  end

  test "should update asset" do
    patch :update, id: @asset, asset: { asset_name: @asset.asset_name, asset_tag: @asset.asset_tag, cost: @asset.cost, notes: @asset.notes, purchase_date: @asset.purchase_date, serial_number: @asset.serial_number, status: @asset.status }
    assert_redirected_to asset_path(assigns(:asset))
  end

  test "should destroy asset" do
    assert_difference('Asset.count', -1) do
      delete :destroy, id: @asset
    end

    assert_redirected_to assets_path
  end
end
