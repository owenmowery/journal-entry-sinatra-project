class SessionsController < ApplicationController
    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        #find user
        user = User.find_by(username: params[:username])
      
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id

            redirect "/workouts"
        else
            redirect "/login"
        end
    end

end