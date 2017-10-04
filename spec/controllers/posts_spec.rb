require 'rails_helper'

describe PostsController, :type => :controller do
  describe 'index' do
    it 'retornando total de posts' do
      get :index
      expect(@controller.totalComments).to eq("500")
    end

    it 'não deve realizar request após primeira chamada' do
      get :index
      expect(@controller).not_to receive(:countComments)
      get :index
      expect(@controller.totalComments).to eq("500")
    end
  end
end
