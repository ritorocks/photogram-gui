class UsersController < ApplicationController
  def index
    matching_users = User.all  

    @list_of_users = matching_users.order({ :username => :asc})
    render ({ :template => "user_templates/index"})
  end

  def add
    
    userid = params.fetch("input_username")
    new_user = User.new

    new_user.username = userid
    new_user.save

    next_url = "/users/" + new_user.username
    redirect_to(next_url)
  
  end
  
  def update
    the_user = params.fetch("user_id")
    input = params.fetch("input_username")
    
    u = User.where({ :id => the_user}).first
    
    u.username = input
    u.save

    next_url = "/users/" + u.username
    redirect_to(next_url)
  end

  def show
    my_username = params.fetch("path_username")
    
    matching_usernames = User.where({:username => my_username})

    @the_user = matching_usernames.at(0)

    if @the_user == nil
      redirect_to("/404")
    else
    render({ :template => "user_templates/show"})
    end
  end
end
