class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc})
    
    
    render({ :template => "photo_templates/index"})
  end
  def show
    photo_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => photo_id })
    
    @my_photo = matching_photos.at(0)
    
    render({ :template => "photo_templates/show"})    
  end
  def destroy
    the_id = params.fetch("p_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy

    #render({ :template => "photo_templates/destroy"})

    redirect_to("/photos")
  end

  def update
    image_url = params.fetch("input_image")
    image_caption = params.fetch("input_caption")
    image_owner_id = params.fetch("input_owner_id")
  
    p = Photo.new
    p.image = image_url
    p.caption = image_caption
    p.owner_id = image_owner_id

    p.save
    redirect_to("/photos/" + p.id.to_s)
  end
  def modify
  # Parameters: {"input_image"=>"https://mc-1b49d921-43a2-4264-88fd-647979-cdn-endpoint.azureedge.net/-/media/quantum-research.png?h=375&iar=0&w=590&rev=7311a2788f1541629fdc0b22098bdcc0&extension=webp&hash=FB1B0A7DBE21082FEA0D70225B7DE87B", "input_caption"=>"Uchicago 3", "modify_id"=>"952"}

    the_id = params.fetch("modify_id")
    image_url = params.fetch("input_image")
    image_caption = params.fetch("input_caption")

    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.at(0)

    the_photo.image = image_url
    the_photo.caption = image_caption

    the_photo.save

    next_url = "/photos/" + the_photo.id.to_s
    redirect_to(next_url )
  end
  
  def add
    a_id = params.fetch("input_author_id")
    comment = params.fetch("input_comment")

    matching_photos = Photo.where({ :id => a_id})

    the_photo = matching_photos.at(0)
    
    the_comment = Comment.new
    the_comment.author_id = a_id
    the_comment.body = comment
    the_comment.photo_id = the_photo.id

    the_comment.save

    next_url = "/photos/" + the_photo.id.to_s
    redirect_to(next_url )
  end
end
