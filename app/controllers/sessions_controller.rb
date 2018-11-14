class SessionsController < ApplicationController
	def destroy_all
  	end

	def create
    	@user = User.find_or_create_by(uid: auth['uid']) do |u|
      		u.name = auth['info']['name']
      		u.uid = auth['uid']
      	end
 
    session[:user_id] = @user.id
 
    render 'welcome/home'
  end

	private
 
 	def auth
    	request.env['omniauth.auth']
	end
end
