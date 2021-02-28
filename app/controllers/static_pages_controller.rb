class StaticPagesController < ApplicationController
  def home
    @faqs = Faq.all
  end
end
