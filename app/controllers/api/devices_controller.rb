class Api::DevicesController < ApplicationController

    def register
        # Create a new device in the database
        @device = Device.create(device_params)
    end

    def alive
        # Create a new heartbeat associated with device
        @device = Device.find(params[:id])
        @heartbeat = @device.heartbeats.create()
    end

    def report
        # Create a new report associated with device
        @device = Device.find(params[:id])
        @report = @device.reports.create()
    end

    def terminate
        # Update device as disabled with timestamp
        @device = Device.find(params[:id])
        # assign current datetime to @device[:disabled_at]
    end

    private

    def device_params
        params.permit(:phone_number, :carrier)
    end

    def report_params
        params.require(:device).permit(:message, :sender)
    end
end
