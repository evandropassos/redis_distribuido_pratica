class MainController < ApplicationController

  def index
    begin
      @contador = $redis.incr('contador:dinamico')
    rescue
      @contador = 'Alterando master...'
    end
  end
end
