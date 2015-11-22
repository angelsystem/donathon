module Api
  class DonationsController < ApplicationController
    #before_filter :authenticathe
    def index
      @donations = current_user.donations
      render :json
    end

    def create
      rand_id = rand_string(40)
      picture_name = params[:picture].original_filename
      picture = params[:picture].read

      s3 = AWS::S3.new
      if s3
        bucket = s3.buckets["donathon-img"]
        s3_obj = bucket.objects[rand_id]
        s3_obj.write(picture, :acl => :public_read)
        picture_url = s3_obj.public_url.to_s

        campaign = Campaign.params[:campaign_id]
        donation = campaign.donations.new(donation_params)
        donation.user = current_user
        if donation.save
          render :json => donation.to_json
        else
          error_str = ""

          donation.errors.each{|attr, msg|
            error_str += "#{attr} - #{msg},"
          }

          e = Error.new(:status => 400, :message => error_str)
          render :json => e.to_json, :status => 400
        end

      else
        e = Error.new(:status => 401, :message => "AWS S3 signature is wrong")
        render :json => e.to_json, :status => 401
      end

    end


    private

    def donation_params
      params.require(:donation).permit(:title, :description, :picture)
    end
  end
end
