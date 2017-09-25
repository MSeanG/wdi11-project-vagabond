class HomeController < ApplicationController
  after_action :allow_iframe, only: [:basic_embed, :awesome_embed]
  
    def home
      end
end
