class StatsapiController < ApplicationController
  before_action :set_stat, only: [:show, :edit, :update, :destroy]
  # respond_to :html, :json
  # GET /stats
  # GET /stats.json
  def index
    @stats = Stat.all
    @stat = Stat.new
    render html: @stats, json: @stats
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stat
      @stat = Stat.find_by_shorturl(params[:shorturl])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stat_params
      params.require(:stat).permit(:hits, :url, :shorturl, :sanitized_url)
    end
end
