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
  end

  def update
  end

  def destroy
  end
end
