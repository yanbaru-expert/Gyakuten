class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @faqs = Faq.all
  end
end
