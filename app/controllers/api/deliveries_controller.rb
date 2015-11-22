module Api
  class DeliveriesController < ApplicationController
    def created
      donation = Donation.find(:donation_id)
      delivery = donation.delivery.new(params_delivery)
      delivery.user = current_user
      if delivery.save
        render :json => donation.to_json, :status => 200
      else
        error_str = ""

        donation.errors.each{|attr, msg|
          error_str += "#{attr} - #{msg},"
        }

        e = Error.new(:status => 400, :message => error_str)
        render :json => e.to_json, :status => 400
      end

    end

    private
      def params_delivery
        params.require(:delivery).permit(:latitude, :longitude, :address, :district, :transport_method_id)
      end
  end
end
