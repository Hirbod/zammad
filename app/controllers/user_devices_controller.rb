# Copyright (C) 2012-2014 Zammad Foundation, http://zammad-foundation.org/

class UserDevicesController < ApplicationController
  before_action :authentication_check

  def index
    devices = UserDevice.where(user_id: current_user.id).order('updated_at DESC')
    devices_full = []
    devices.each {|device|
      attributes = device.attributes
      if device.location_details['city']
        attributes['location'] += ", #{device.location_details['city']}"
      end
      attributes.delete('created_at')
      attributes.delete('device_details')
      attributes.delete('location_details')

      if session[:check_user_device_id] == device.id
        attributes['current'] = true
      end
      devices_full.push attributes
    }
    model_index_render_result(devices_full)
  end

  def destroy
    # find device
    user_device = UserDevice.find_by(user_id: current_user.id, id: params[:id])

    # delete device and session's
    if user_device
      SessionHelper.list.each {|session|
        next if !session.data['user_id']
        next if !session.data['check_user_device_id']
        next if session.data['check_user_device_id'] != user_device.id
        SessionHelper.destroy( session.id )
      }
      user_device.destroy
    end
    render json: {}, status: :ok
  end

end