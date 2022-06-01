class Api::V1::TeasController < ApplicationController
  def index
    render json: TeaSerializer.new(Tea.all)
  end
end