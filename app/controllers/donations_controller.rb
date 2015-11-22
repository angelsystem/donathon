class DonationsController < ApplicationController
  def index
    campaign = Campaign.find(params[:campaign_id])
    @donations = campaign.donations
  end
end
