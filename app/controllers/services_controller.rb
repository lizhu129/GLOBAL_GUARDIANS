class ServicesController < ApplicationController
  def index
    @services = Services.all
  end
end
