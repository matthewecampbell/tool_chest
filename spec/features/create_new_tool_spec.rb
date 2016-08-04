require 'rails_helper'

describe "Create new tool", :type => :feature do
  scenario "User creates a new tool" do
    visit new_tool_path

    fill_in "Name", :with => "Screwdriver"
    click_button "Create Tool"

    within(".tool_info") do
      expect(page).to have_content("Screwdriver")
    end
  end

    scenario "User sees all tools they've created" do
    visit new_tool_path
    fill_in "Name", :with => "Screwdriver"
    click_button "Create Tool"

    click_link "Create New Tool"
    fill_in "Name", :with => "Hammer"
    click_button "Create Tool"

    within(".tool_info") do
      expect(page).to have_content("Screwdriver")
    end
    within(".tool_info") do
      expect(page).to have_content("Hammer")
    end
  end

    scenario "User sees a specific tool" do
    visit new_tool_path
    fill_in "Name", :with => "Screwdriver"
    click_button "Create Tool"
    click_link "See Tool"

    within(".header") do
    expect(page).to have_content("Screwdriver")
      end
    end

    scenario "User deletes a specific tool" do
    visit new_tool_path
    fill_in "Name", :with => "Screwdriver"
    click_button "Create Tool"
    click_link "See Tool"
    click_link "Delete Tool"

    within(".tool_info") do
    expect(page).to_not have_content("Screwdriver")
  end
end

  scenario "User edits a tool" do
    visit new_tool_path
    fill_in "Name", :with => "Screwdriver"
    click_button "Create Tool"
    click_button "Edit tool"

    fill_in "Name", :with => "Axe"
    click_button "Edit Tool"

    within(".tool_info") do
      expect(page).to_not have_count("Screwdriver")
      expect(page).to have_count("Axe")
    end
  end




end
