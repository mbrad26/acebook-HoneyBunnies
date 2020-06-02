class UsersController < ApplicationController

  def index
    @title = 'This is a title passed in from controller'
    @body = 'This is a body that been passed in'
  end

  def about
    @about = 'This is about something !'
  end

end
