class PageController < ApplicationController

    def ping
        response = {
            message: "ok",
            status: true,
            data: nil
        }
        render :json => response, :status => :ok
    end

end
