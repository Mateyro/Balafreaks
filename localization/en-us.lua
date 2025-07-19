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
            k_hackb = { "Pythagoras!" },
            k_hackb_d = { "Poor!" },
            k_balf_unclearvar = "Color Variant",
            k_plus_goop = { "Gooped!" },
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
                    "{s:0.75}(If hand contains a Flush five consisting of only{} {C:hearts,s:0.75}Hearts{}",
                    "{s:0.75}create 2 Negative {C:dark_edition,s:0.75}The Fool{} {s:0.75}consumeables){}",
                }
            },
            j_balf_frost = {
                name = 'Frost',
                text = {
                    "Makes all Cards played into",
                    "{C:blue,E:2}Frozen{} Cards",
                }
            },
            j_balf_tanaka = {
                name = 'Tanaka',
                text = {
                    "Copies food Joker to it's right.",
                    "Effect copied is {C:balf_rainbow}buffed{}.",
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
                name = 'Mister Scary',
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
                    "Gains {X:mult,C:white}X0.1{} Mult per {C:attention}Ace in deck{}.",
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
                    "Gains {X:mult,C:white}X2{} Mult every {C:money}$1{} you have,",
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
                    "This joker gains {X:dark_edition,C:white}^0.5{} Mult",
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
                    "{s:0.6}(Also needs {C:money,s:0.6}upkeep{}{s:0.6}, if you don't have {}{C:money,s:0.6}$10{}{s:0.6} at the {}{C:attention,s:0.6}start of round{}{s:0.6}, {}",
                    "{C:red,s:0.6}self destructs{}{s:0.6}){}",
                }
            },
            j_balf_sophie = {
                name = 'The void speaks back.',
                text = {
                    "This Joker gains {C:mult}+#1# Mult{} per",
                    "{C:spades}Queen of Spades{} in your deck.",
                    "{C:inactive}(Currently{} {C:mult}+#2# Mult{}{C:inactive}){}",
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
            j_balf_chris = {
                name = 'Chris',
                text = {
                    "Gives {C:mult}Mult{} equal to",
                    "{C:chips}Hands{} and {C:red}Discards{} left.",
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
            j_balf_brokenunclear = {
                name = "{C:inactive}You broke it{}",
                text = {
                    "{C:inactive}Whoops!, looks like you broke it!{}",
                    "{C:red}Takes 1 dollar per hand played{}.",
                    "{C:red}Do not sell this card{}.",
                }
            },
            j_balf_motherunclear = {
                name = "Mother...",
                text = {
                    "Sell to {V:1}Motherize{}",
                    "neighbouring cards.",
                }
            },
            j_balf_mother3 = {
                name = "Mother 3",
                text = {
                    "{V:1}Motherizes{} Joker to the {C:attention}Right{}",
                    "Requires a {V:1}sacrifice{}...",
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
                    "Timer {C:attention}looses a minute{} per",
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
                    "when boss {C:attention}blind{} is selected.",
                }
            },
            j_balf_nokaru = {
                name = 'Nokaru',
                text = {
                    "Applies {C:default}The Orb{}",
                    "to every card played.",
                }
            },
        },
    Blind = {
        bl_balf_mother = {
                name = "The Mother",
                text = {
                    "Debuffs all Jokers with Editions",
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
                    "Every other time a hand",
                    "is drawn, all cards held in",
                    "hand are converted to Stone",
                }
            },
        bl_balf_station = {
                name = "The Station",
                text = {
                    "Maybe it was all a dream...",
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
                    "All playing cards disabled.",
                }
            },
        bl_balf_eclipse = {
                name = "Eclipsed Moon",
                text = {
                    "Hands set to 1.",
                    "Discards set to 0.",
                    "Adds Scrap cards to Deck",
                    "every time a Hand is drawn.",
                }
            },
        bl_balf_elevator = {
                name = "Falling Elevator",
                text = {
                    "X2 Base chips every",
                    "hand the Blind isn't beat",
                }
            },
    },
    Enhanced = {
			m_balf_frozen = {
				name = "Frozen Card",
				text = {"{X:mult,C:white}X#1# {} Mult",
						"Destroyed if played",
				}
			},
            m_balf_goop = {
				name = "Goop Card",
				text = {
                    "Copies last card",
                    "scored before it.",
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