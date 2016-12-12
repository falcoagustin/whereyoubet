class EventsController < ApplicationController

  def get_events
    conn = faraday_connection('www.google.com')
    response = conn.get ''
    process_events_results(repsonse.body)
    respond_to do |format|
      if @algo.save
        format.json { render :show, status: :created, location: @algo }
      else
        format.json { render json: @algo.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_own_events
    @all_events = Event.all
    respond_to do |format|
      format.json {render json: @all_events, status: :ok}
    end
  end

  private
    def faraday_connection(url)
      conn = Faraday.new(:url => url) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
      return conn
    end

    def process_events_results(body)
      return body
    end
end
