class Api::DevicesController < ApplicationController

    def register
        # Create a new device in the database
        @device = Device.new(device_params)
        if @device.valid?
            @device.save
            render json: { device: @device }, status: :created
        else
            render json: { error: @device.errors.full_messages }, status: 500
        end
    end

    def alive
        # Create a new heartbeat associated with device
        if Device.exists?(params[:id])
            @device = Device.find(params[:id])
            if @device.disabled_at != nil 
                render json: { error: "Device is disabled" }, status: 500
            else
                @heartbeat = @device.heartbeats.create()
                render json: { device: @device }, status: :created
            end
        else
            render json: { error: "Device ID does not exist" }, status: 500
        end
    end

    def report
        # Create a new report associated with device
        if Device.exists?(report_params[:device_id])
            @device = Device.find(report_params[:device_id])
            if @device.disabled_at != nil 
                render json: { error: "Device is disabled" }, status: 500
            else
                @report = @device.reports.create(report_params)
                render json: { device: @report }, status: :created
            end
        else
            render json: { error: "Device ID does not exist" }, status: 500
        end
    end

    def terminate
        # Update device as disabled with timestamp
        # assign current datetime to @device[:disabled_at]
        if Device.exists?(params[:id])
            @device = Device.find(params[:id])
            if @device.disabled_at != nil 
                render json: { error: "Device is already disabled" }, status: 500
            else
                @device.update(disabled_at: DateTime.now)
                render json: { device: @device }, status: :ok
            end
        else
            render json: { error: "Device ID does not exist" }, status: 500
        end
    end

    private

    def device_params
        params.permit(:phone_number, :carrier)
    end

    def report_params
        params.permit(:device_id, :message, :sender)
    end
end
