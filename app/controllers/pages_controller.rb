class PagesController < ApplicationController
before_action :check_signed_in
    def landing
    end
    def check_signed_in
    	redirect_to events_path if signed_in?
    end
end
