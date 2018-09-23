require 'test_helper'

class RealEstateCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @real_estate_company = real_estate_companies(:one)
  end

  test "should get index" do
    get real_estate_companies_url
    assert_response :success
  end

  test "should get new" do
    get new_real_estate_company_url
    assert_response :success
  end

  test "should create real_estate_company" do
    assert_difference('RealEstateCompany.count') do
      post real_estate_companies_url, params: { real_estate_company: { Address: @real_estate_company.Address, Founded: @real_estate_company.Founded, Id: @real_estate_company.Id, Name: @real_estate_company.Name, Revenue: @real_estate_company.Revenue, Size: @real_estate_company.Size, Synopsis: @real_estate_company.Synopsis, Webstie: @real_estate_company.Webstie } }
    end

    assert_redirected_to real_estate_company_url(RealEstateCompany.last)
  end

  test "should show real_estate_company" do
    get real_estate_company_url(@real_estate_company)
    assert_response :success
  end

  test "should get edit" do
    get edit_real_estate_company_url(@real_estate_company)
    assert_response :success
  end

  test "should update real_estate_company" do
    patch real_estate_company_url(@real_estate_company), params: { real_estate_company: { Address: @real_estate_company.Address, Founded: @real_estate_company.Founded, Id: @real_estate_company.Id, Name: @real_estate_company.Name, Revenue: @real_estate_company.Revenue, Size: @real_estate_company.Size, Synopsis: @real_estate_company.Synopsis, Webstie: @real_estate_company.Webstie } }
    assert_redirected_to real_estate_company_url(@real_estate_company)
  end

  test "should destroy real_estate_company" do
    assert_difference('RealEstateCompany.count', -1) do
      delete real_estate_company_url(@real_estate_company)
    end

    assert_redirected_to real_estate_companies_url
  end
end
