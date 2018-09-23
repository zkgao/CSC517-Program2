require "application_system_test_case"

class RealEstateCompaniesTest < ApplicationSystemTestCase
  setup do
    @real_estate_company = real_estate_companies(:one)
  end

  test "visiting the index" do
    visit real_estate_companies_url
    assert_selector "h1", text: "Real Estate Companies"
  end

  test "creating a Real estate company" do
    visit real_estate_companies_url
    click_on "New Real Estate Company"

    fill_in "Address", with: @real_estate_company.Address
    fill_in "Founded", with: @real_estate_company.Founded
    fill_in "Id", with: @real_estate_company.Id
    fill_in "Name", with: @real_estate_company.Name
    fill_in "Revenue", with: @real_estate_company.Revenue
    fill_in "Size", with: @real_estate_company.Size
    fill_in "Synopsis", with: @real_estate_company.Synopsis
    fill_in "Webstie", with: @real_estate_company.Webstie
    click_on "Create Real estate company"

    assert_text "Real estate company was successfully created"
    click_on "Back"
  end

  test "updating a Real estate company" do
    visit real_estate_companies_url
    click_on "Edit", match: :first

    fill_in "Address", with: @real_estate_company.Address
    fill_in "Founded", with: @real_estate_company.Founded
    fill_in "Id", with: @real_estate_company.Id
    fill_in "Name", with: @real_estate_company.Name
    fill_in "Revenue", with: @real_estate_company.Revenue
    fill_in "Size", with: @real_estate_company.Size
    fill_in "Synopsis", with: @real_estate_company.Synopsis
    fill_in "Webstie", with: @real_estate_company.Webstie
    click_on "Update Real estate company"

    assert_text "Real estate company was successfully updated"
    click_on "Back"
  end

  test "destroying a Real estate company" do
    visit real_estate_companies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Real estate company was successfully destroyed"
  end
end
