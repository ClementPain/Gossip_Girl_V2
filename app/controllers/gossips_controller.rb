class GossipsController < ApplicationController
	def team
  end

  def contact
  end

  def index
    @list_gossips = Gossip.all
  end

  def show
     @gossip_searched = Gossip.find(params[:id])
     @comments_linked = []
     Comment.all.each do |comment|
       if @gossip_searched.id == comment.gossip_id
        @comments_linked << comment
       end
     end
  end

  def new
  	@new_gossip = Gossip.new
  end

  def create

    if !User.find_by(pseudo: params[:user_pseudo]).nil?
      @new_gossip = Gossip.new('user_id' => User.find_by(pseudo: params[:user_pseudo]).id,
                     'title' => params[:gossip_title],
                     'content' => params[:gossip_content])
    
      if @new_gossip.save
        redirect_to gossips_path, notice: "Le potin #{@new_gossip.title} a bien été créé"
        puts 'Le potin a été créé !'
        
      else
        redirect_to new_gossip_path, alert: "Certaines informations sont incorrectes : le titre doit faire entre 3 et 14 caractères"
      end

    else
      redirect_to new_gossip_path, alert: "Le pseudo saisi n\'existe pas"

      puts 'Le pseudo saisi n\'existe pas'
    end 
  end

  def edit
    @new_gossip = Gossip.find(params[:id])
  end

  def update
    @new_gossip = Gossip.new('user_id' => User.find_by(pseudo: params[:user_pseudo]).id,
                     'title' => params[:gossip_title],
                     'content' => params[:gossip_content])
    #post_params = params.require(:gossip).permit(:gossip_title, :gossip_content)
    if @new_gossip.update(post_params)
      redirect_to new_gossip_path
    else
      render :edit
    end
  end

  def post_params
    post_params = params.require(:gossip).permit(:gossip_title, :gossip_content)
  end

  def destroy
  
  
  end
end
