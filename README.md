# pokemon_go
With this Rubygem you can calculate the hidden individual values (IV) of your Pokémon in Pokémon Go.

In Pokémon GO, IVs have a range of 0 to 15. Pokémon have an IV for each of their three basic stats: HP, Attack, and Defense. In Pokémon GO, IVs are the only factor that can distinguish one Pokémon's stats from another's of the same species if they have the same Power Up level.
Pokémon hatched from Eggs have a high chance of having high IVs.

This gem has been ported from a [Google Spreadsheet](https://docs.google.com/spreadsheets/d/1Ut8fmEYRokyQa9pQEDbAuFtpKOCTS54tQ9K7fU1LveI/edit#gid=1812532592). Thanks to the original author.

# How to use
To make calculations, you need to have a trainer (`me`) and a Pokemon
(`pikachu`). We are going to calculate the stats like this:

```ruby
require 'pokemon_go'

me = PokemonGo::Trainer.new(11)
pikachu = PokemonGo::Pokemon.new("pikachu", :pikachu, 132, 26, 600, true)
pikachu_stats = PokemonGo::CalculateIV.new(pikachu, me)
pikachu_stats.calculate
```

You can query the minimum and maximum values of the pokemon's perfectness:
```ruby
pikachu_stats.min_perfectness
# => 0.266
pikachu_stats.max_perfectness
# => 0.977
```

You can query all different combinations of IVs:
```ruby
pikachu_stats.combinations.count
# => 88
pikachu_stats.combinations
# => see all IV combinations
```

See some information about the calculation:
```ruby
pikachu_stats.print_result
# => see some information about the calculation
# => Pokemon: 'pikachu' <PIKACHU> cp: 132, hp: 26, dust: 600, leveled: true
# 26.67% - 97.78% perfectness
# 88 combinations found
# A: 0 / D: 4 / S: 10
# A: 0 / D: 5 / S: 10
# A: 1 / D: 3 / S: 10
# A: 2 / D: 1 / S: 10
# A: 3 / D: 0 / S: 10
```
