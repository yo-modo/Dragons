class Dragon

    def initialize(name, gender)
        @name = name
        @gender = gender
        if @gender == "male"
            @gender = {"subjective" => "he", "objective" => "him", "possessive" => "his"}
        else @gender = {"subjective" => "she", "objective" => "her", "possessive" => "her"}
        end
        @alive = true
        @asleep = false
        @stuffinbelly = 7
        @stuffinintestine = 0
        @pooponfloor = 0
        @dirtonscales = 3
        @sleepcycle = 10
    
        puts "\nCongratulations!  You're the proud new owner of a baby dragon!  You call #{@gender["objective"]} #{@name}.\n"
    end
    
    def feed
        puts "\n#{@name} is happy with #{@gender["possessive"]} T-bone dinner!\n"
        @stuffinbelly = (@stuffinbelly + 5)
        passageoftime
    end
    
    def walk
        puts "\nYou take #{@gender["objective"]} for a nice, long walk.\n"
        @stuffinintestine = @stuffinintestine - 10
        passageoftime
    end
    
    def scoop
        if @pooponfloor > 0 
            puts "\nYou scoop giant piles of poop off the floor.\n"
            @pooponfloor = @pooponfloor - 10
        else puts "\nNothing to scoop.\n"
        end
        passageoftime
    end
    
    def wash
        puts "\nYou give #{@name} a sudsy bath!\n"
        @dirtonscales = (@dirtonscales - 5)
        if @dirtonscales < 0
            @dirtonscales = 0
        end
        passageoftime
    end
    
    def rock
        puts "\n#{@gender["subjective"]} falls asleep in your arms.\n"
        @asleep = true
        @sleepcycle = (@sleepcycle + 5)
        passageoftime
        if @asleep == true
            @asleep = false
            puts "\n#{@name} gently wakes up.\n"
        end
    end
    
    private
    
    def hungry? #max capacity = 50, dragon explodes
        @stuffinbelly <= 4
    end
    
    def gottago? #max = 10 before dragon poops on floor
        @stuffinintestine >= 6
    end
    
    def poopy? #max capacity = 30 before you drown in poop
        @pooponfloor >= 10
    end
    
    def dirty? #scales fall off when dirty = 20, dragon dies
        @dirtonscales >= 12
    end
    
    def sleepy? #if sleepcycle = 0, dragon dies from exhaustion
        @sleepcycle <= 3
    end

    def wakes?
        if @asleep
            @asleep = false
            puts "#{@name} wakes up suddenly!"
        end
    end
    
    def living?
    
        if @stuffinbelly <= 0
            wakes?
            puts "\n#{@name} is starving! In desperation, #{@gender["subjective"]} ate YOU!\n"
            exit
        elsif @stuffinbelly >= 30
            wakes?
            puts "\nBaby dragon #{@name} exploded! You fed #{@gender["objective"]} too much.\n"
            exit
        elsif @dirtonscales >= 20
            wakes?
            puts "\nPoor baby #{@name}'s scales fell off! You killed your dragon.\n"
            exit
        elsif @sleepcycle <= 0
            puts "\nBaby #{@name} expired from exhaustion.\n"
            exit
        else @alive = true
        end
    end
        
    def passageoftime
    
        if living?

            if @stuffinbelly > 0
                @stuffinbelly = (@stuffinbelly - 2)
                @stuffinintestine = (@stuffinintestine + 2)
            end
            
            if @stuffinintestine >= 10
                @stuffinintestine = 0
                @pooponfloor = (@pooponfloor + 10)
                puts "Whoops! #{@name} had an accident . . ."
                if @pooponfloor >= 20
                    wakes?
                    puts "You drowned in #{@name}'s poop! Ewwwwww."
                    exit
                end
            end
                        
            @dirtonscales = (@dirtonscales + 1)
                        
            @sleepcycle = (@sleepcycle - 1)

            if hungry?
                wakes?
                puts "#{@name}'s stomach grumbles loudly . . ."
            end

            if gottago?
                wakes?
                puts "#{@name} does the potty dance . . ."
            end

            if poopy?
                wakes?
                puts "#{@name} doesn't like smelling #{@gender["possessive"]} own defecation . . ."
            end
            
            if dirty?
                wakes?
                puts "#{@name} itches and scratches . . ."
            end
            
            if sleepy?
                wakes?
                puts "#{@name} seems groggy and confused . . ."
                end
                
        end
                
    end
    
end

eggcolor = ['white', 'crimson', 'sapphire', 'indigo', 'golden', 'orange', 'red', 'violet', 'black', 'green', 'emerald', 'aqua', 'ruby', 'topaz', 'silver', 'copper', 'umber']
dragoncolor = ['white','black','green','blue','violet','brown','red','yellow']
dragongender = ['girl', 'boy',]

story = "\nYou find yourself walking through the forest on a bright and sunny day. A sudden glint catches your eye coming from an area thick with undergrowth. Curiosity being a certain weakness of yours you head into the dark part of the forest to investigate. As you work yourself forward through a thick hedge of thorns, full bushes of heather, and tall ferns you see a growing glow. Your heart races as you fight your way through the brush and hear popping, clawing, and cracking noises. You catch glimpses of pastel jewel tones scintillating just beyond your vision's reach. Suddenly, you burst out on top of . . . . . A DRAGON'S NEST!!!\n \nYou caress the smooth hot stones and quickly choose one manageable to carry. You retreat hastily to the safety of your home, put the egg in the ashes of the morning's fire, and stoke the flames. The scratching becomes louder, a low hissing noise is growing in force, and cracks appear in white hot bolts from end to end. You worry that the yowling noise that has begun eminating from the #{eggcolor[rand(eggcolor.length)]} pearlescent egg will draw too much attention from your neighbors, and perhaps even the mother dragon. Just when your sensibilities have almost caught up with the actual severity of the situation, the inglenook explodes in a rainbow of razor sharp shell. As the smoke clears and the hissing from the overturned cauldron slowly ceases, you peek into the hearth and see a bright, shining, #{dragoncolor[rand(dragoncolor.length)]} dragon!\n"

puts story

gender = dragongender[rand(dragongender.length)]

puts "\nIt's a #{gender}!\n"

if gender == 'boy'
    gender = 'male'
else gender = 'female'
end

puts "\nWhat are you going to name your dragon?\n"
name = gets.chomp.capitalize

dragon = Dragon.new(name, gender)

input = gets.chomp.downcase

help = "\nHere are the ways you can interact with your baby dragon, #{name}:\n\nfeed, walk, scoop, wash, or rock."

while input != "exit"
    if input == "feed"
        dragon.feed
    elsif input == "walk"
        dragon.walk
    elsif input == "scoop"
        dragon.scoop
    elsif input == "wash"
        dragon.wash
    elsif input == "rock"
        dragon.rock
    else puts help
        puts
    end
    input = gets.chomp.downcase
end