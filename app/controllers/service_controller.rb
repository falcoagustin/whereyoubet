class ServiceController < ApplicationController

  include UsersHelper

  before_action :user_signed_in?, :authenticate_user!, :restrict_user_access

  def call_events_service
    service = params[:service]
    from_date = service[:from]
    to_date = service[:to]
    league_id = service[:league_id]
    conn = faraday_connection(events_ms_url + events_ms_params(from_date, to_date, league_id))
    persist_matches(conn.get)
    redirect_to :back
  end

  def match_results
    match_id = params[:match_id]
    winner = params[:winner]
    result = MatchResult.new(:winner => winner, :match_id => match_id)
    result.save
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

    def persist_matches(response)
      matches = JSON.parse response.body
      for match in matches
        byebug
        local = Team.find_or_create_by(:name => match['local_team_name'])
        visitor = Team.find_or_create_by(:name => match['visitor_team_name'])
        m = Match.new(:api_id => match['api_id'], :time => match['schedule'], :local_team => local, :visitor_team => visitor)
        m.save
      end
    end

    def events_ms_url
      return 'https://dry-sea-13686.herokuapp.com/events.json'
    end

    def events_ms_params(from, to, league_id)
      return '?from=\'%s\'&to=\'%s\'&league_id=%s' % [from, to, league_id]
    end

end
