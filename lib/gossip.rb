require 'csv'
require 'pry'

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
#Methode retourner le neme - 1 ^^
def self.find(id)
  all_gossips = Gossip.all
  return all_gossips[id.to_i-1]
end
#Methode de update : je n'ai pas trouvé simple update. donc je fais un sav dans un tableau, sup et on recrée
def self.update (id, nom, contenu)
  all_gossips = Gossip.all
  all_gossips[id.to_i-1].author = nom
  all_gossips[id.to_i-1].content = contenu
  File.delete("./db/gossip.csv")
  CSV.open("./db/gossip.csv", "ab") do |csv|
    all_gossips.each do |items|
      csv << [items.author, items.content]
    end
  end
end

end