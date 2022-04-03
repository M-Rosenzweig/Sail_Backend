class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  

 get "/boxes" do
     boxes =  Box.all
      boxes.to_json
  end

  get "/comments/:box_id" do
    box = Box.find(params[:box_id])
    box.comments.to_json(include: :user)
  end

   patch "/upvote/:box_id" do 
    found_Box = Box.find(params[:box_id])
    found_Box.upvotes = found_Box.upvotes + 1
    found_Box.save

    found_Box.to_json
  end

  patch "/downvote/:box_id" do 
    found_Box = Box.find(params[:box_id])
    found_Box.upvotes = found_Box.upvotes - 1
    found_Box.save

    found_Box.to_json
  end

  post "/comments" do
    box = Box.find(params[:box_id])
    comment = box.comments.create(text: params[:text], user_id: params[:user_id])
    comment.to_json(include: :user)
  end

  delete "/comments/:id" do
    comment = Comment.find(params[:id])
    comment.destroy
    comment.to_json
  end










  
  
  # get "/upvotes/:box_id" do
  #   upvote = Upvote.find(box_id: params[:box_id])
  #   upvote.amount
  # end

 

end
