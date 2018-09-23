class HomeController < ApplicationController
  before_action :authenticate_admin!, :only => [:index, :new]
  def index
  end
end
