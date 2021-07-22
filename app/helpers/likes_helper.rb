module LikesHelper
  def like_or_unlike_button(event, like)
    if like 
      button_to "✰ Unlike", event_like_path(event, like),
                  method: :delete             
    else 
      #  button_to "* Like", event_likes_path(event), method: :post   
      #  button_to by default uses POST method:
      button_to " ⭐ Like", event_likes_path(event)   
    end    
  end
end