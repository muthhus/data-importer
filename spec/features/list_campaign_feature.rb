require "rails_helper"
	describe "listing campaign " do
		it "allows a user to view the campaign" do
			visit api_v1_campaign_index_path
			fill_in "Name", with: "ssss_uk_01B"
			fill_in "Score", with: "263\nT77" 
			click_on("Create Project")
			visit api_v1_campaign_path
			expect(page).to have_content("ssss_uk_01B") 
			expect(page).to have_content("263")
		end 
end