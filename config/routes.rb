Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })

  get("/users", { :controller => "users", :action => "index" })

  get("/users/:path_username", { :controller => "users", :action => "show"})

  post("/add_user", { :controller => "users", :action => "add"})

  post("/update_user/:user_id",{ :controller => "users", :action => "update" })

  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:path_id", { :controller => "photos", :action => "show" })

  get("/delete_photo/:p_id", { :controller => "photos", :action => "destroy" })

  post("/insert_photo_record", { :controller => "photos", :action => "update"})

  post("/update_photo/:modify_id", { :controller => "photos", :action => "modify" })

  post("/add_comment/", { :controller => "photos", :action => "add" })
end
