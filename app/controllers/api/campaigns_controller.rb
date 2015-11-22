module Api
  class CampaignsController < ApplicationController
    def index
      @campaigns = Campaign.all
      render json: @campaigns
    end
  end
end
