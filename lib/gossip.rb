require 'csv'

class Gossip
  attr_accessor :author, :content

def initialize(nom, contenu)
  @author = nom
  @content = contenu
  puts @author
  puts @content 
end

#Methode d'enregistrement de potin
def save
  CSV.open("./db/gossip.csv", "ab") do |csv|
  csv << [@author, @content]
  end
end

#Methode pour lister l'ensemble des potins.
def self.all
  all_gossips = []
  CSV.read("./db/gossip.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
  return all_gossips
end

def self.find(id)
  all_gossips = Gossip.all
  #all_gossips.index { |index| return all_gossips[index] if  index == id}
  return all_gossips[id.to_i-1]
end

def self.update (id, nom, contenu)
  all_gossips = Gossip.all
  
end

end