# Write your code here!
require 'pry'
def game_hash
            {:home => 
                {:team_name => "Brooklyn Nets",
                :colors => ["Black", "White"],
                :players => 
                    {"Alan Anderson"=> 
                        {:number => 0, 
                        :shoe => 16,
                        :points => 22,
                        :rebounds => 12,
                        :assists => 12,
                        :steals => 3,
                        :blocks => 1,
                        :slam_dunks => 1},
                    "Reggie Evans" =>
                        {:number => 30, 
                        :shoe => 14, 
                        :points => 12,
                        :rebounds => 12,
                        :assists => 12,
                        :steals => 12,
                        :blocks => 12,
                        :slam_dunks => 7},
                    "Brook Lopez" =>
                        {:number => 11, 
                        :shoe => 17, 
                        :points => 17,
                        :rebounds => 19,
                        :assists => 10,
                        :steals => 3,
                        :blocks => 1,
                        :slam_dunks => 15},
                    "Mason Plumlee" =>
                        {:number => 1, 
                        :shoe => 19, 
                        :points => 26,
                        :rebounds => 12,
                        :assists => 6,
                        :steals => 3,
                        :blocks => 8,
                        :slam_dunks => 5},
                    "Jason Terry" =>
                        {:number => 31, 
                        :shoe => 15, 
                        :points => 19,
                        :rebounds => 2,
                        :assists => 2,
                        :steals => 4,
                        :blocks => 11,
                        :slam_dunks => 1},
                        }},
            :away =>
            {:team_name => "Charlotte Hornets",
                :colors => ["Turquoise", "Purple"],
                :players => 
                    {"Jeff Adrien"=> 
                        {:number => 4, 
                        :shoe => 18,
                        :points => 10,
                        :rebounds => 1,
                        :assists => 1,
                        :steals => 2,
                        :blocks => 7,
                        :slam_dunks => 2},
                    "Bismak Biyombo"=> 
                        {:number => 0, 
                        :shoe => 16,
                        :points => 12,
                        :rebounds => 4,
                        :assists => 7,
                        :steals => 7,
                        :blocks => 15,
                        :slam_dunks => 10},
                    "DeSagna Diop"=> 
                        {:number => 2, 
                        :shoe => 14,
                        :points => 24,
                        :rebounds => 12,
                        :assists => 12,
                        :steals => 4,
                        :blocks => 5,
                        :slam_dunks => 5},
                    "Ben Gordon"=> 
                        {:number => 8, 
                        :shoe => 15,
                        :points => 33,
                        :rebounds => 3,
                        :assists => 2,
                        :steals => 1,
                        :blocks => 1,
                        :slam_dunks => 0},
                    "Brendan Haywood"=> 
                        {:number => 33, 
                        :shoe => 15,
                        :points => 6,
                        :rebounds => 12,
                        :assists => 12,
                        :steals => 22,
                        :blocks => 5,
                        :slam_dunks => 12},
                        }}}
end
def num_points_scored(name)
  game_hash.each{|location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!

      team_data.each{|attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        if attribute == :players
            #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
            data.each{|pname,stats|
                if(name == pname)
                    stats.each{|thing, num|
                        if thing == :points
                            return num
                        end
                    }
                end
            }
        end
      }
  }
end

def shoe_size(name)
  game_hash.each{|location, team_data|
      team_data.each{|attribute, data|
        if attribute == :players
            data.each{|pname,stats|
                if(name == pname)
                    stats.each{|thing, num|
                        if thing == :shoe
                            return num
                        end
                    }
                end
            }
        end
      }
  }
end
def team_colors(tname)
      game_hash.each{|location, team_data|

      team_data.each{|attribute, data|
        if attribute == :team_name
            if data == tname
                return team_data.values_at(:colors)[0]
            end
        end
      }
    }
end
def team_names
    tname = []
    i = 0
    game_hash.each{|location, team_data|
      team_data.each{|attribute, data|
        if attribute == :team_name
            tname[i] = data
            i= i+1
        end
      }
    }
    return tname
end
def player_numbers(team_name)
    numbers = []
    i = 0
    game_hash.each{|location, team_data|
        if team_data.values_at(:team_name)[0]==team_name
            team_data.each{|attribute, data|
                if attribute == :players
                    data.each{|pname,stats|
                        stats.each{|thing, num|
                            if thing == :number
                                numbers[i]=num
                                i = i+1
                            end
                        }
                    }
                end
            }
        end
      }
    return numbers
end
    
def player_stats(name)
    game_hash.each{|location, team_data|
        team_data.each{|attribute, data|
            if attribute == :players
                data.each{|pname,stats|
                    if(name == pname)
                    return stats
                    end
                }
            end
        }
    }
end

def big_shoe_rebounds
    max_size = find_max
        game_hash.each{|location, team_data|
            team_data.each{|attribute, data|
                if attribute == :players
                    data.each{|pname,stats|
                        if stats.values_at(:shoe)[0]==max_size
                            return stats.values_at(:rebounds)[0]
                        end
                    }
                end
            }
        }
end

def find_max
    max_size = 0
    game_hash.each{|location, team_data|
            team_data.each{|attribute, data|
                if attribute == :players
                    data.each{|pname,stats|
                        stats.each{|thing, number|
                            if thing == :shoe
                                if number > max_size
                                    max_size = number
                                end
                            end
                        }
                    }
                end
            }
    }
return max_size
end
                            



