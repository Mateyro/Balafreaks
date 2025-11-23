return {
    misc = {
        v_dictionary = {
            k_powmult = { "^#1# Mult" },
            k_powchips = { "^#1# Chips" },
            k_balf_unclearvar = "Color Variant",
            k_plus_goop = { "Gooped!" },
        },
        dictionary = {
            k_seal = { "Sealed!" },
            k_pregnant = { "fuck yoy" },
            k_melon = { "Purified!" },
            k_ems = { "Touched!" },
            k_ems_d = { "Denied!" },
            k_frost = { "Frozen!" },
            k_gummies = { "Shoved!" },
            k_hackb = { "Pythagoras!" },
            k_hackb_d = { "Poor!" },
            k_balf_unclearvar = "Color Variant",
            k_plus_goop = { "Gooped!" },
            k_togore = { "Togoretastic." },
        },
        labels = {
            k_plus_goop = "Gooped!",
            k_balf_unclearvar = "Color Variant",
            balf_mother = "Motherized",
            balf_orb_seal = 'Orb',
        }
    },
    descriptions = {
        Joker = {
            j_balf_davis = {
                name = 'Davis',
                text = {
                    "If the {C:attention}first{} card in the",
                    "played hand contains a {C:enhanced}seal{},",
                    "apply {C:enhanced}seal{} to the rest",
                    "of cards in played hand.",
                }
            },
            j_balf_sienna = {
                name = 'Sienna',
                text = {
                    "Creates a {C:tarot}The Fool{} card if",
                    "hand played is a flush consisting of {C:hearts}hearts{}.",
                    "Only works on the first hand played.",
                }
            },
            j_balf_frost = {
                name = 'Frost',
                text = {
                    "Makes all Cards played into",
                    "{C:blue,E:2}Frozen{} Cards",
                }
            },
            j_balf_togore = {
                name = 'Togore Dreamer',
                text = {
                    "If {C:attention}Last Played Hand{} of",
                    "the {C:attention}Blind{} is {C:planet}High Card{}",
                    "then give {C:attention}#1#{} Free {C:green}Rerolls{}",
                }
            },
            j_balf_gflash = {
                name = 'Green Flash',
                text = {
                    "If hand contains both {C:clubs}Clubs{}",
                    "and {C:diamonds}Diamonds{}, {C:attention}Retrigger{}",
                    "all {C:clubs}Clubs{} and {C:diamonds}Diamonds{}",
                }
            },
            j_balf_tanaka = {
                name = 'Tanaka',
                text = {
                    "If a {C:attention}food{} Joker",
                    "is {C:red}destroyed{},",
                    "{C:balf_rainbow}Absorb{} it's effect.",
                }
            },
            j_balf_zero = {
                name = 'Zero',
                text = {
                    "Set ante to {V:1,B:2,C:edition,E:1,s:2} 0 {} when {s:1.4}sold.{}",
                }
            },
            j_balf_joe = {
                name = 'Joe',
                text = {
                    "Sometimes they just require",
                    "a bit of love...",
                    "{C:mult}+#1# Mult{}",
                }
            },
            j_balf_joe2 = {
                name = 'Joe V2',
                text = {
                    "Why would you do that?",
                    "{C:mult}+#1# Mult{}",
                }
            },
            j_balf_joe3 = {
                name = 'Joe V3',
                text = {
                    "...",
                    "{C:mult}+#1# Mult{}",
                }
            },
            j_balf_joebroke = {
                name = 'You broke it.',
                text = {
                    "Congratulations.",
                    "You broke it."
                }
            },
            j_balf_joewins = {
                name = 'Joe',
                text = {
                    "The prettiest of roses",
                    "rise from the smallest of places",
                    "{X:mult,C:white}x#1#{} Mult",
                    "{C:dark_edition}+1 Joker Slot{}",
                }
            },
            j_balf_sightseer = {
                name = 'The Sightseer',
                text = {
                    "Once {C:attention}Boss Blind{} is defeated",
                    "{C:attention}destroys itself{} and generates a",
                    "{C:legendary}Legendary{} Joker from {C:balf_rainbow}Balafreaks{}",
                }
            },
            j_balf_yuri = {
                name = 'Yuri-Kyo',
                text = {
                    "{C:attention}Duplicates{} every other",
                    "{C:planet}Planet{} card used.",
                    "{C:planet}#2#{}",
                }
            },
            j_balf_walter = {
                name = 'Walter Barns',
                text = {
                    "Every {C:clubs}Club{} Card is",
                    "considered a {C:green}Lucky{} Card",
                }
            },
            j_balf_richard = {
                name = 'Richard Lost',
                text = {
                    "If {C:attention}first hand{} of round",
                    "has only {C:attention}1{} card, adds 3",
                    "permanent copies to deck",
                    "and draws them to {C:attention}hand{}",
                    "{C:red}Self-Destructs{}",
                }
            },
             j_balf_scary = {
                name = 'mister scary.',
                text = {
                    "{C:green}#1# in #2# chance{} to add {C:mult}+#3# Mult{}",
                    "to {C:attention}every card{} in the deck.",
                    "If {C:green}chance{} is {C:red}failed{} then add",
                    "{C:mult}-#3# Mult{} to {C:attention}every card{} in the deck"
                }
            },
            j_balf_acecards = {
                name = 'Ace of Cards',
                text = {
                    "Gains {X:mult,C:white}X#1#{} Mult per {C:attention}Ace in deck{}.",
                    "{C:inactive}(Currently{} {X:mult,C:white}X#3#{} {C:inactive}Mult){}"
                }
            },
            j_balf_melon = {
                name = 'Melon',
                text = {
                    "At {C:attention}the end of round{},",
                    "If the Joker to it's right",
                    "is {C:dark_edition}Negative{}, then remove {C:dark_edition}Negative{}",
                    "edition and add {C:dark_edition}+1 Joker Slot{}",
                }
            },
            j_balf_scam = {
                name = 'SCAM',
                text = {
                    "At the end of every {C:attention}Blind{},",
                    "{C:green}#1# in #2# Chance{} to halve",
                    "your {C:money}money{}, if {C:green}Chance{} {C:red}failed{}",
                    "double your {C:money}money{}."
                }
            },
            j_balf_ai = {
                name = 'Can i beat Balatro with an AI Girlfriend???',
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "{C:attention}Force-selects{} 5 Cards",
                }
            },
            j_balf_ems = {
                name = 'Ems',
                text = {
                    "At {C:attention}the end of round{}, adds",
                    "{V:1}Touched{} to the Joker to it's",
                    "{C:attention}right{}.",
                }
            },
            j_balf_goblin = {
                name = 'Greedy Goblin',
                text = {
                    "Gains {X:mult,C:white}X3{} Mult every {C:money}$1{} you have,",
                    "Removes {C:attention}all{} of your {C:money}money{}",
                    "{X:mult,C:white}XMult{} Modifier gets",
                    "{C:attention}reset at end of the Ante{}.",
                    "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}",
                }
            },
            j_balf_p_goblin = {
                name = 'Pregnant Goblin',
                text = {
                    "{C:balf_rainbow}fuck you{}"
                }
            },
            j_balf_matt = {
                name = 'Mattea',
                text = {
                    "{C:attention}Skips an ante{} at the end",
                    "of every {C:attention}boss blind{}.",
                    "This joker gains {X:dark_edition,C:white}^#2#{} Mult",
                    "per every Ante Skipped {C:attention}by itself{}.",
                    "{C:inactive}(Currently{} {X:dark_edition,C:white}^#1#{} {C:inactive}Mult){}",
                }
            },
            j_balf_hackb = {
                name = 'Hackbetals',
                text = {
                    "This Joker {C:attention}replaces{} the equation",
                    "for your points to be",
                    "{C:attention}Chips^2 + Mult^2{} instead of",
                    "{C:attention}Chips x Mult.{}",
                    "{s:0.6}(Also needs {C:money,s:0.6}upkeep{}{s:0.6}, if you don't have {}{C:money,s:0.6}$4{}{s:0.6} at the {}{C:attention,s:0.6}start of round{}{s:0.6}, {}",
                    "{C:red,s:0.6}self destructs{}{s:0.6}, takes 25% of your money otherwise){}",
                }
            },
            j_balf_charlie = {
                name = 'Charlie',
                text = {
                    "This Joker gives {C:mult}+#1# Mult{} for each",
                    "{C:clubs}Club{} card you play, also",
                    "{C:red}Destroys{} the {C:clubs}Club{} card.",
                }
            },
            j_balf_neighbour = {
                name = 'Hello Neighbour',
                text = {
                    "Randomly retriggers Joker",
                    "to it's right or left",
                }
            },
            j_balf_kade = {
                name = 'Kade',
                text = {
                    "Retriggers {X:balf_rainbow,C:white}EVERY{} {X:balf_rainbow,C:white}OTHER{} Joker",
                }
            },
            j_balf_dudey = {
                name = 'Dudey',
                text = {
                    "Adds an extra choice to {C:attention}all{} Booster Packs.",
                }
            },
            j_balf_maddyx = {
                name = 'Maddyx',
                text = {
                    "Adds an extra Voucher Slot.",
                }
            },
            j_balf_batpeg = {
                name = 'Batpeg',
                text = {
                    "{C:money}+#1#${} Every time a blind is {C:attention}Skipped{}",
                }
            },
            j_balf_chris = {
                name = 'Chris',
                text = {
                    "Gives {C:mult}Mult{} equal to",
                    "{C:chips}Hands{} and {C:red}Discards{} left.",
                }
            },
            j_balf_check_it = {
                name = 'Check It',
                text = {
                    "{C:green}#1# in #2# chance{} to give {X:mult,C:white}X#3#{} Mult",
                    "If {C:green}chance{} is {C:red}failed{} then {X:mult,C:white}X#4#{} Mult",
                }
            },
            j_balf_toucher = {
                name = 'The Toucher',
                text = {
                    "{C:attention}Sell{} to {V:1}Touch{}",
                    "the Joker to it's {C:attention}right{}.",
                }
            },
            j_balf_starwalker = {
                name = 'The Original       Starwalker',
                text = {
                    "Retriggers all cards with",
                    "a        {C:diamonds}Diamond{} suit.",
                }
            },
            j_balf_logspam = {
                name = 'Log Spam',
                text = {
                    "{C:attention}Plank{} Cards now",
                    "also give {X:chips,C:white}X#1#{} Chips.",
                }
            },
            j_balf_gaster = {
                name = 'W.D. Gaster',
                text = {
                    "Every {C:attention}#2#{} cards played,",
                    "gains {C:mult}+#3# Mult{}.",
                    "{C:inactive}(Currently {}{C:mult}+#1# Mult{}{C:inactive}){}",
                }
            },
            j_balf_aids = {
                name = 'Aids',
                text = {
                    "All {C:attention}listed{} {C:green}probabilities{}",
                    "become {C:red}0{}.",
                    "If you don't beat a",
                    "non-{C:attention}boss blind{} in {C:attention}one{}",
                    "hand, then {C:red}Self-Destructs{}.",
                }
            },
            j_balf_grilled = {
                name = 'Space-Time Warping Grilled Cheese',
                text = {
                    "Once {C:attention}Boss Blind{} is defeated",
                    "{C:green}#1# in #2# chance{} to {C:red}Self-Destruct{}",
                    "and {C:attention}warp{} you back an {C:attention}Ante{}",
                }
            },
            j_balf_grimace = {
                name = 'Pregnant Grimace Water Bottle',
                text = {
                    "Each {C:attention}Discarded card{} permanently gains",
                    "{C:chips}+#1#{} chips, chips gained increases",
                    "by {C:chips}+#2#{} each blind defeated.",
                    "{C:red}Self-Destructs{} when it",
                    "reaches {C:chips}+60{} chips",
                }
            },
            j_balf_surprise = {
                name = 'Surprise Milk Attack',
                text = {
                    "Gives {X:mult,C:white}X#1#{} Mult when",
                    "in a {C:attention}Boss Blind{}.",
                    "Has {C:red}#2#{} uses left.",
                }
            },
            j_balf_gravity = {
                name = 'Two Gravity Hammers',
                text = {
                    "Every time a {C:attention}Pair{} is played",
                    "in a {C:attention}Boss Blind{},",
                    "{C:planet}Level up{} Pair.",
                }
            },
            j_balf_obblongale = {
                name = 'Obblongale',
                text = {
                    "At the start of a blind",
                    "{C:mult}Susses out{} a joker",
                    "If that Joker is {C:attention}sold{},",
                    "generates an {C:spectral}Ethereal Tag{}.",
                }
            },
            j_balf_watermelon = {
                name = 'Watermelon',
                text = {
                    "{C:mult}+#1#{} Mult",
                    "{C:red}Self-Destructs{} when",
                    "{C:attention}Boss Blind{} is defeated.",
                }
            },
            j_balf_gummies = {
                name = 'Fruit Gummies',
                text = {
                    "{C:mult}+#1#{} Mult to all played cards",
                    "{C:red}Self-Destructs{} in {C:attention}#2#{} rounds.",
                }
            },
            j_balf_myname = {
                name = 'My name is',
                text = {
                    "Gives {X:mult,C:white}X#1#{} Mult if",
                    "your {C:attention}name{} contains",
                    "{C:attention}Z T{} or {C:attention}C{}",
                }
            },
            j_balf_reaper = {
                name = "Reaper's Touch",
                text = {
                    "Generates a {C:tarot}Death{} card",
                    "when blind is {C:attention}defeated{}",
                    "on the {C:attention}first hand{}",
                }
            },
            j_balf_dispenser = {
                name = "Dispenser",
                text = {
                    "{C:attention}Steel{} cards and {C:attention}Gold{}",
                    "cards now count as {C:attention}eachother{}",
                }
            },
            j_balf_charles = {
                name = 'Charles',
                text = {
                    "Played {C:attention}Stone{} cards",
                    "gain {C:chips}+#1#{} Chips",
                }
            },
            j_balf_unclear = {
                name = 'Unclear',
                text = {
                    "{C:attention}Sell{} to obtain one of",
                    "their {X:balf_rainbow,C:white}Color{} variants",
                    "Every time a hand is",
                    "played, gains {X:chips,C:white}X1{} Chips",
                    "{C:inactive}(Currently{} {X:chips,C:white}X#1#{} {C:inactive}Chips){}",
                }
            },
            j_balf_runclear = {
                name = 'Red Unclear',
                text = {
                    "Gains {X:mult,C:white}X2{} Mult per",
                    "card {C:attention}Sold{}.",
                    "{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}",
                }
            },
            j_balf_gunclear = {
                name = 'Green Unclear',
                text = {
                    "At the {C:attention}start{} of",
                    "{C:attention}blind{}, Creates a",
                    "{C:dark_edition}Negative{} {C:legendary}Legendary{} Joker",
                    "Then {C:attention}destroys itself{}.",
                }
            },
            j_balf_punclear = {
                name = 'Purple Unclear',
                text = {
                    "Per {C:attention}Hand played{}",
                    "Create a {C:dark_edition}Negative{} Tarot Card",
                }
            },
            j_balf_wunclear = {
                name = 'Faceless',
                text = {
                    "Once {C:attention}blind{} is selected, {C:attention}destroy{}",
                    "all {C:attention}Face{} cards, add {C:dark_edition}Joker Slots{}",
                    "equal to face cards {C:attention}Destroyed{}.",
                    "{C:red}Self-Destructs{}.",
                }
            },
            j_balf_bunclear = {
                name = 'Identity',
                text = {
                    "Once {C:attention}blind{} is selected,",
                    "{X:balf_rainbow,C:white}Triplicate{} all Jokers.",
                    "{C:attention}Set Joker Slots to 0{}",
                    "{C:red}Jokers are no longer buyable{}.",
                    "{C:red}Self-Destructs{}.",
                }
            },
            j_balf_motherunclear = {
                name = "Mother...",
                text = {
                    "Sell to {V:1}Motherize{}",
                    "neighbouring cards.",
                }
            },
            j_balf_teeth = {
                name = "Can of Teeth",
                text = {
                    "{C:red}+#1#{} Discards",
                    "{C:red}-1{} Discards per {C:attention}Blind{} selected",
                }
            },
            j_balf_tables = {
                name = "The Tables",
                text = {
                    "If a {C:attention}Four of a Kind{} is Played,",
                    "first {C:attention}Scored{} card becomes",
                    "a {C:attention}Plank{} Card",
                }
            },
            j_balf_lemons = {
                name = "FishingLemons",
                text = {
                    "In {C:attention}Final Hand{}, first played",
                    "card becomes {C:dark_edition}Negative{}",
                }
            },
            j_balf_mother3 = {
                name = "Mother 3",
                text = {
                    "{V:1}Motherizes{} Joker to the {C:attention}Right{}",
                    "{V:1}Sacrifices{} the Joker to it's {C:attention}left{}",
                }
            },
            j_balf_guwbi = {
                name = "Guwbi",
                text = {
                    "Starts a {C:attention}timer{}...",
                    "Better go {C:attention}fast{}.",
                    "If the timer ever reaches",
                    "{C:attention}3 Minutes{}, it {C:red}breaks{}.",
                    "Gains {X:dark_edition,C:white}^0.25{} Chips and",
                    "Timer {C:attention}loses a minute{} per",
                    "{C:attention}Boss Blind{} beaten while",
                    "the timer is {C:attention}intact{}.",
                    "{C:inactive}(Currently{} {X:dark_edition,C:white}^#4#{} {C:inactive}Chips){}",
                    "{X:purple,C:white,s:1.6}#5{}",
                }
            },
            j_balf_greg = {
                name = 'Greg',
                text = {
                    "Generates a {V:1}Goop Card{}",
                    "when {C:attention}blind{} is selected.",
                }
            },
            j_balf_maxdesignpro = {
                name = 'MaxDesignPro',
                text = {
                    "When {C:attention}clicked{}, gains {C:chips}+#2#{} Chips",
                    "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips){}",
                }
            },
            j_balf_waveify = {
                name = 'Waveify',
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "{C:attention}Destroys{} Joker to it's {C:attention}Right{},",
                    "Gives {C:money}Dollars{} equal to {C:white,X:money}X3{} the",
                    "sell value of the Joker destroyed.",
                }
            },
            j_balf_crash = {
                name = 'Crash Message',
                text = {
                    "{C:attention}Scrap{} cards now count as",
                    "both {C:attention}Gold{} and {C:attention}Steel{} Cards",
                }
            },
            j_balf_opportunity = {
                name = 'The Opportunity',
                text = {
                    "In {C:attention}Boss Blinds{}, triples",
                    "all {C:attention}listed{} {C:green}probabilities{}",
                    "{C:inactive}(ex: {C:green}1 in 4{C:inactive} -> {C:green}3 in 4{C:inactive})",
                }
            },
            j_balf_balf = {
                name = 'Balafreaks',
                text = {
                    "{C:red}+#2#{} Mult per Joker",
                    "from {C:balf_rainbow}Balafreaks{}",
                    "{C:inactive}(Currently +{}{C:attention}#1#{}{C:inactive} Mult){}",
                }
            },
            j_balf_member = {
                name = 'Member List',
                text = {
                    "{C:red}+1{} Mult per member",
                    "In the {C:balf_rainbow}Freaktures{}, if you",
                    "hold a {C:attention}Joker{} from {C:balf_rainbow}Balafreaks{}",
                    "{C:inactive}(Currently +{}{C:attention}#1#{}{C:inactive} Mult){}",
                }
            },
            j_balf_guardian = {
                name = 'Elder Guardian Jumpscare',
                text = {
                    "{C:red}Destroys{} one {C:money}[Suit]{} from your {C:attention}deck{},",
                    "{C:money}[Suit]{} is randomly chosen at",
                    "the {C:attention}start of each blind{}",
                    "{C:inactive}(Currently {V:1}#1#{}{C:inactive}){}",
                }
            },
            j_balf_IOU = {
                name = 'I. O. U.',
                text = {
                    "You can buy {C:green}1{}",
                    "{C:attention}Joker, Consumeable,{}",
                    "or {C:attention}Booster Pack{} for {C:green}Free{}",
                    "per {C:attention}Ante{}.",
                }
            },
            j_balf_sol = {
                name = 'Sol',
                text = {
                    "Gains +{C:attention}#2#{} Hand Size",
                    "each {C:attention}Boss Blind{} beat.",
                    "{C:inactive}(Currently +{}{C:attention}#1#{}{C:inactive} Hand Size){}",
                }
            },
            j_balf_spamton = {
                name = "Spamton Crypto Scam",
                text = {
                    "Retriggers Cards with a rank of{C:attention}#2#{}",
                    "{C:attention,s:1.997}#1#{} additional times,",
                    "{C:money}[Rank]{} changes every round.",
                },
            },
            j_balf_placeholder = {
                name = "Placeholder",
                text = {
                    "{C:chips}+#1#{} Chips",
                },
            },
            j_balf_batter = {
                name = "The Batter",
                text = {
                    "{C:red}Destroys{} a random {C:attention}Card{} from",
                    "{C:attention}Hand{} at the {C:attention}End of Round{}",
                    "then gains {X:mult,C:white}X#2#{} Mult",
                    "{C:inactive}(Currently{} {X:mult,C:white}X#3#{} {C:inactive}Mult){}",
                },
            },
            j_balf_tyronne = {
                name = 'Tyrone',
                text = {
                    "Each time the played",
                    "hand isn't a {C:attention}straight{},",
                    "add {C:chips}+#2#{} to Chips",
                    "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips){}",
                }
            },
            j_balf_nokaru = {
                name = 'Nokaru',
                text = {
                    "Applies {C:attention}The Orb{}",
                    "to every card played.",
                    "Each {C:attention}Orb{} now also counts",
                    "as a random {C:attention}Seal{}"
                }
            },
        },
    Blind = {
        bl_balf_mother = {
                name = "The Mother",
                text = {
                    "Debuffs all Jokers with Motherized",
                }
            },
        bl_balf_greedy = {
                name = "The Greedy",
                text = {
                    "If score is >X2 blind", 
                    "requirement, set money to $0",
                }
            },
        bl_balf_woodchipper = {
                name = "The Woodchipper",
                text = {
                    "Destroys all consumables,",
                    "X1.5 Blind Requirement per",
                    "Consumable destroyed",
                }
            },
        bl_balf_lethal = {
                name = "The Company",
                text = {
                    "Adds Scrap cards to Deck",
                    "every time a Hand is drawn"
                }
            },
        bl_balf_miner = {
                name = "The Miner",
                text = {
                    "Every time a hand",
                    "is played, all cards held in",
                    "hand have a 1 in 4 chance",
                    "to be turned to stone",
                }
            },
        bl_balf_station = {
                name = "The Station",
                text = {
                    "Maybe it was all a dream...",
                    "-1 Ante when beat.",
                }
            },
        bl_balf_twirl = {
                name = "The Twirl",
                text = {
                    "-1 Rank to all cards",
                    "held in hand or played",
                }
            },
        bl_balf_disabled = {
                name = "Sans Francisco",
                text = {
                    "Wait a minute...",
                    "this isn't Sans Francisco.",
                    "1 in 2 Chance to disable any",
                    "playing card in your hand.",
                }
            },
        bl_balf_eclipse = {
                name = "Eclipsed Moon",
                text = {
                    "Hands set to 1.",
                    "Adds Scrap cards to Deck",
                    "every time a Hand is drawn.",
                }
            },
        bl_balf_elevator = {
                name = "Falling Elevator",
                text = {
                    "X1.5 Base chips every",
                    "hand the Blind isn't beat",
                }
            },
    },
    Enhanced = {
			m_balf_frozen = {
				name = "Frozen Card",
				text = {"{X:mult,C:white}X#1# {} Mult",
						"{C:green}#3# in #2# chance{} to destroy",
                        "itself when played.",
				}
			},
            m_balf_goop = {
				name = "Goop Card",
				text = {
                    "Copies last card",
                    "scored before it.",
				}
			},
            m_balf_plank = {
				name = "Plank Card",
				text = {
                    "Gains {X:mult,C:white}X#1#{} Mult per",
                    " {C:attention}Plank Card{} in Deck,",
                    "{C:inactive}(Currently{} {X:mult,C:white}X#3#{} {C:inactive}Mult){}",
				}
			},
            m_balf_scrap = {
				name = "Scrap Card",
				text = {
                    "It's worthless.",
                    "Destroyed if held in hand",
                    "at the end of blind.",
				}
			},
        },
    Edition = {
        e_balf_mother = {
				name = "Motherized",
				text = {
					"{V:1}Automatically Retriggers{}",
                    "{V:1}this Joker.{}",
				},
			},
        },
    Other = {
        balf_orb_seal = {
				name = "Orb",
				text = {
					"Always counts",
                    "towards scoring.",
				},
			},
        }
    }
}