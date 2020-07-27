#ligne inutile suite a la création du fichier config.ru
#require 'bundler'
#Bundler.require
require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    # ligne inutile suite à la création de views
    #"<html><head><title>The Gossip Project</title></head><body><h1>Mon super site de gossip !</h1></body></html>"
    #erb :index
    erb :index, locals: {gossips: Gossip.all}
  end
#ligne inutile suite a la création du fichier config.ru
#  run! if app_file == $0
  get '/gossips/new/' do
    erb :new_gossip
  end
  post '/gossips/new/' do
    puts "Ce programme ne fait rien pour le moment, on va donc afficher un message dans le terminal"
    #Gossip.new("super_auteur", "super_gossip").save
    Gossip.new(params[:gossip_author],params[:gossip_content]).save
    #puts "Salut, je suis dans le serveur"
    #puts "Ceci est le contenu du hash params : #{params}"
    #puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
    #puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
    #puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
    redirect '/'
  end
  get '/gossips/:id/' do
    #puts "Voici le numéro du potin que tu veux : #{params["id"]} !"
    #puts Gossip.find(params["id"])
    erb :show, locals: { id: params["id"], the_gossip: Gossip.find(params["id"])}
  end

  get '/gossips/:id/edit/' do
    erb :edit, locals: { id: params["id"], the_gossip: Gossip.find(params["id"])}
  end

  post '/gossips/:id/edit/' do
    puts "Voici le numéro du potin que tu veux : #{params["id"]} !"
    Gossip.update(params["id"],params["gossip_author"],params["gossip_content"])
  end
  
end