class HomeController < ApplicationController
  after_filter :allow_iframe, only: [:basic_embed, :awesome_embed]
  
    def home
      end
end
