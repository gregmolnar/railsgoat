# frozen_string_literal: true
class DashboardController < ApplicationController
  skip_before_action :has_info

  def home
    @user = current_user

    # See if the user has a font preference
    if params[:font]
      cookies[:font] = params[:font]
    end
  end

  def change_graph
    self.try(params[:graph])
  end

  def bar_graph
    render :bar_graph, layout: false
  end

  def pie_charts
     @user = current_user
     render :dashboard_stats, layout: false
  end

end
