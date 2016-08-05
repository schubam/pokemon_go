module PokemonGo
  Stat = Struct.new(:attack, :defense, :stamina, :evolution)

  class BaseStats
    @@pokemons = {}

    def self.for(pokemon)
      @@pokemons[pokemon.to_sym]
    end

    def self.levels_for_dust(dust)
      data = {"200" => 1, "400" => 3, "600" => 5, "800" => 7, "1000" => 9, "1300" => 11, "1600" => 13,
              "1900" => 15, "2200" => 17, "2500" => 19, "3000" => 21, "3500" => 23, "4000" => 25,
              "4500" => 27, "5000" => 29, "6000" => 31, "7000" => 33, "8000" => 35, "9000" => 37,
              "10000" => 39}
      min_index = data.keys.index(dust.to_s)
      min_level = data.values[min_index]
      max_level = data.values[min_index+1]

      [max_level-0.5, min_level]
    end

    def self.cp_multiplier_by_level(level)
      data = { "1" => 0.0940000, "1.5" => 0.1351374, "2" => 0.1663979,
               "2.5" => 0.1926509, "3" => 0.2157325, "3.5" => 0.2365727,
               "4" => 0.2557201, "4.5" => 0.2735304, "5" => 0.2902499,
               "5.5" => 0.3060574, "6" => 0.3210876, "6.5" => 0.3354450,
               "7" => 0.3492127, "7.5" => 0.3624578, "8" => 0.3752356,
               "8.5" => 0.3875924, "9" => 0.3995673, "9.5" => 0.4111936,
               "10" => 0.4225000, "10.5" => 0.4335117, "11" => 0.4431076,
               "11.5" => 0.4530600, "12" => 0.4627984, "12.5" => 0.4723361,
               "13" => 0.4816850, "13.5" => 0.4908558, "14" => 0.4998584,
               "14.5" => 0.5087018, "15" => 0.5173940, "15.5" => 0.5259425,
               "16" => 0.5343543, "16.5" => 0.5426358, "17" => 0.5507927,
               "17.5" => 0.5588306, "18" => 0.5667545, "18.5" => 0.5745692,
               "19" => 0.5822789, "19.5" => 0.5898879, "20" => 0.5974000,
               "20.5" => 0.6048188, "21" => 0.6121573, "21.5" => 0.6194041,
               "22" => 0.6265671, "22.5" => 0.6336492, "23" => 0.6406530,
               "23.5" => 0.6475810, "24" => 0.6544356, "24.5" => 0.6612193,
               "25" => 0.6679340, "25.5" => 0.6745819, "26" => 0.6811649,
               "26.5" => 0.6876849, "27" => 0.6941437, "27.5" => 0.7005429,
               "28" => 0.7068842, "28.5" => 0.7131691, "29" => 0.7193991,
               "29.5" => 0.7255756, "30" => 0.7317000, "30.5" => 0.7377735,
               "31" => 0.7377695, "31.5" => 0.7407856, "32" => 0.7437894,
               "32.5" => 0.7467812, "33" => 0.7497610, "33.5" => 0.7527291,
               "34" => 0.7556855, "34.5" => 0.7586304, "35" => 0.7615638,
               "35.5" => 0.7644861, "36" => 0.7673972, "36.5" => 0.7702973,
               "37" => 0.7731865, "37.5" => 0.7760650, "38" => 0.7789328,
               "38.5" => 0.7817901, "39" => 0.7846370, "39.5" => 0.7874736,
               "40" => 0.7903000, "40.5" => 0.7931164}
      data.fetch(level.to_s.gsub('.0', ''))
    end

    private

    def initialize(name, attack, defense, stamina, evolution=nil)
      @@pokemons[name.to_sym] = Stat.new(attack.to_i, defense.to_i, stamina.to_i, evolution.nil? ? nil : evolution.to_sym)
    end

    def self.load_stats
      %w(bulbasaur,126,126,90,venusaur
ivysaur,156,158,120,venusaur
venusaur,198,200,160,
charmander,128,108,78,charizard
charmeleon,160,140,116,charizard
charizard,212,182,156,
squirtle,112,142,88,blastoise
wartortle,144,176,118,blastoise
blastoise,186,222,158,
caterpie,62,66,90,butterfree
metapod,56,86,100,butterfree
butterfree,144,144,120,
weedle,68,64,80,beedrill
kakuna,62,82,90,beedrill
beedrill,144,130,130,
pidgey,94,90,80,pidgeot
pidgeotto,126,122,126,pidgeot
pidgeot,170,166,166,
rattata,92,86,60,raticate
raticate,146,150,110,
spearow,102,78,80,fearow
fearow,168,146,130,
ekans,112,112,70,arbok
arbok,166,166,120,
pikachu,124,108,70,raichu
raichu,200,154,120,
sandshrew,90,114,100,sandslash
sandslash,150,172,150,
nidoran♀,100,104,110,nidoqueen
nidorina,132,136,140,nidoqueen
nidoqueen,184,190,180,
nidoran♂,110,94,92,nidoking
nidorino,142,128,122,nidoking
nidoking,204,170,162,
clefairy,116,124,140,clefable
clefable,178,178,190,
vulpix,106,118,76,ninetales
ninetales,176,194,146,
jigglypuff,98,54,230,wigglytuff
wigglytuff,168,108,280,
zubat,88,90,80,golbat
golbat,164,164,150,
oddish,134,130,90,vileplume
gloom,162,158,120,vileplume
vileplume,202,190,150,
paras,122,120,70,parasect
parasect,162,170,120,
venonat,108,118,120,venomoth
venomoth,172,154,140,
diglett,108,86,20,dugtrio
dugtrio,148,140,70,
meowth,104,94,80,persian
persian,156,146,130,
psyduck,132,112,100,golduck
golduck,194,176,160,
mankey,122,96,80,primeape
primeape,178,150,130,
growlithe,156,110,110,arcanine
arcanine,230,180,180,
poliwag,108,98,80,poliwrath
poliwhirl,132,132,130,poliwrath
poliwrath,180,202,180,
abra,110,76,50,alakazam
kadabra,150,112,80,alakazam
alakazam,186,152,110,
machop,118,96,140,machamp
machoke,154,144,160,machamp
machamp,198,180,180,
bellsprout,158,78,100,victreebel
weepinbell,190,110,130,victreebel
victreebel,222,152,160,
tentacool,106,136,80,tentacruel
tentacruel,170,196,160,
geodude,106,118,80,graveler
graveler,142,156,110,golem
golem,176,198,160,
ponyta,168,138,100,rapidash
rapidash,200,170,130,
slowpoke,110,110,180,slowbro
slowbro,184,198,190,
magnemite,128,138,50,magneton
magneton,186,180,100,
farfetch'd,138,132,104,
doduo,126,96,70,dodrio
dodrio,182,150,120,
seel,104,138,130,dewgong
dewgong,156,192,180,
grimer,124,110,160,muk
muk,180,188,210,
shellder,120,112,60,cloyster
cloyster,196,196,100,
gastly,136,82,60,haunter
haunter,172,118,90,
gengar,204,156,120,
onix,90,186,70,
drowzee,104,140,120,hypno
hypno,162,196,170,
krabby,116,110,60,kingler
kingler,178,168,110,
voltorb,102,124,80,electrode
electrode,150,174,120,
exeggcute,110,132,120,exeggutor
exeggutor,232,164,190,
cubone,102,150,100,marowak
marowak,140,202,120,
hitmonlee,148,172,100,hitmonchan
hitmonchan,138,204,100,
lickitung,126,160,180,
koffing,136,142,80,weezing
weezing,190,198,130,
rhyhorn,110,116,160,rhydon
rhydon,166,160,210,
chansey,40,60,500,
tangela,164,152,130,
kangaskhan,142,178,210,
horsea,122,100,60,seadra
seadra,176,150,110,
goldeen,112,126,90,seaking
seaking,172,160,160,
staryu,130,128,60,starmie
starmie,194,192,120,
mr. mime,154,196,80,
scyther,176,180,140,
jynx,172,134,130,
electabuzz,198,160,130,
magmar,214,158,130,
pinsir,184,186,130,
tauros,148,184,150,
magikarp,42,84,40,gyarados
gyarados,192,196,190,
lapras,186,190,260,
ditto,110,110,96,
eevee,114,128,110,vaporeon
vaporeon,186,168,260,
jolteon,192,174,130,
flareon,238,178,130,
porygon,156,158,130,
omanyte,132,160,70,omastar
omastar,180,202,140,
kabuto,148,142,60,kabutops
kabutops,190,190,120,
aerodactyl,182,162,160,
snorlax,180,180,320,
articuno,198,242,180,
zapdos,232,194,180,
moltres,242,194,180,
dratini,128,110,82,dragonite
dragonair,170,152,122,dragonite
dragonite,250,212,182,
mewtwo,284,202,212,
mew,220,220,200).each do |line|
        name, attack, defense, stamina, evolution = line.split(',')
        new(name, attack, defense, stamina, evolution)
      end
    end
    load_stats
  end 
end 

