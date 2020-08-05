class CommentsController < ApplicationController
  def new
    @new_comment = Comment.new(gossip_id:params[:gossip_id])
  end

  def create
    if !User.find_by(pseudo: params[:user_pseudo]).nil?
      @new_comment = Comment.new('user_id' => User.find_by(pseudo: params[:user_pseudo]).id,
                      'gossip_id' => params[:gossip_id],
                     'content' => params[:comment_content])
    
      if @new_comment.save
        redirect_to gossips_path(@new_comment.gossip_id), notice: "Le commentaire a bien été créé"
        puts 'Le commentare a été créé !'
        
      else
        redirect_to new_gossip_comment_path, alert: "Certaines informations sont incorrectes"
      end

    else
      redirect_to new_gossip_comment_path, alert: "Le pseudo saisi n\'existe pas"

      puts 'Le pseudo saisi n\'existe pas'
    end 
  end

  def update
  end

  def edit
  end

  def show
  end

  def index
  end

  def delete
    
  end
end
