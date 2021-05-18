class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:perfil]
  def home
  end

  def perfil
  end
end
