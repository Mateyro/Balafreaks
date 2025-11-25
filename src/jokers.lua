-- NEW JOKERS TO BE ADDED NEXT UPDATE
-- SLAB (goop card)
-- Master Pieces
-- Motorcycle Interruption
-- sorrounded with 8 netherite
-- Ominous Notification, SISYPHUS "Im gonna r you"
-- harvey
-- Big Dylan
-- Yume Nikki
-- YET ANOTHER SURVIVOR VS KILLER GAME
-- FREAK T.I. REFERENCE
-- FNF MOD Reference (ice cards)
-- Birthright (checks for your name and it contains a special thing for every freakture)
-- Banned Member List
-- Darek
-- decks
--
-- backlog
--
-- smear
-- big monkey swirly balls
-- mr mine (Stone Cards)
-- week long minecraft server
-- Clip Dump
-- elephant greenscreen effect
-- john freakture
-- Labubu 2p tycoon
-- DAVE
-- dave after 500 years (waveify "YOU KNEW DARBZ?")
-- what will i have after 500 days?!? dave and waveify redraw
-- stonecutters (Stone Cards)
--
-- NEXT UPDATE
-- Combat Initiation Ref
-- Evil man & Barn Fight 2 ref
-- That one guy that had a funny face and is posted in mod for no reason
-- rivalry between w.d. gaster and Mother 3
-- Maddyx & Dudey reworks
-- Vouchers that replace Maddyx and Dudey's original effects
-- more blinds?
-- more decks?
-- FRT PACKS
-- Tags
-- Redesigns
-- Evil and fucked up Teto - Generates an FRT card every Hand played - Rare

to_big = to_big or function(x) return x end

-- COMMON

SMODS.Joker {
    key = "joe",
    atlas = 'Jokers',
    pos = { x = 0, y = 5 },
    rarity = 1,
    blueprint_compat = true,
    cost = 3,
    no_pool_flag = 'joe_change',
    config = { extra = { mult = 4, evo = 0 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
            else if context.selling_self then
                G.GAME.pool_flags.joe_change = true
                SMODS.add_card {
                    set = 'Joker',
                    key = 'j_balf_joe2',
                }
                else if context.end_of_round and G.GAME.blind.boss and context.game_over == false and context.main_eval and not context.blueprint then
                    card.ability.extra.evo = card.ability.extra.evo+1
                    if card.ability.extra.evo > 2 then
                        local my_pos = nil
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i] == card then
                                my_pos = i
                                break
                            end
                        end
                        if G.jokers.cards[my_pos].edition ~= nil then
                            G.GAME.pool_flags.joe_change = true
                            card:start_dissolve()
                            SMODS.add_card {
                                set = 'Joker',
                                key = 'j_balf_joewins',
                                edition = G.jokers.cards[my_pos].edition
                            }
                        else
                            G.GAME.pool_flags.joe_change = true
                            card:start_dissolve()
                            SMODS.add_card {
                                set = 'Joker',
                                key = 'j_balf_joewins',
                            }
                        end
                    end
                end
            end
        end
        in_pool = function(self, args)
            return G.GAME.pool_flags.joe_change
        end
    end
}

SMODS.Joker {
    key = "joe2",
    atlas = 'Jokers',
    pos = { x = 1, y = 5 },
    rarity = 1,
    blueprint_compat = true,
    cost = 6,
    config = { extra = { mult = 8 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    in_pool = function(self, args)
        return false
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        else if context.selling_self then
            SMODS.add_card {
                set = 'Joker',
                key = 'j_balf_joe3',
            }
        end
    end
    end
}

SMODS.Joker {
    key = "joe3",
    atlas = 'Jokers',
    pos = { x = 2, y = 5 },
    rarity = 1,
    blueprint_compat = true,
    cost = 12,
    config = { extra = { mult = 16 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    in_pool = function(self, args)
        return false
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        else if context.selling_self then
            SMODS.add_card {
                set = 'Joker',
                key = 'j_balf_joebroke',
            }
        end
    end
    end
}

SMODS.Joker {
    key = "joebroke",
    atlas = 'Jokers',
    pos = { x = 3, y = 5 },
    rarity = 1,
    blueprint_compat = true,
    cost = 1,
    in_pool = function(self, args)
        return false
    end,
    calculate = function(self, card, context)
    end
}

SMODS.Joker {
    key = "joewins",
    atlas = 'Jokers',
    pos = { x = 4, y = 5 },
    rarity = 1,
    blueprint_compat = true,
    cost = 24,
    config = { extra = { xmult = 2.5 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    in_pool = function(self, args)
        return false
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return { 
                Xmult_mod = card.ability.extra.xmult,
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } } 
                }
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end
}

SMODS.Joker {
    key = "reaper",
    atlas = 'Jokers',
    pos = { x = 15, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 6,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.current_round.hands_played < 2 then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = 'Tarot',
                            key = 'c_death',
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = localize('k_plus_tarot'),
                    colour = G.C.SECONDARY_SET.Tarot,
                    remove = true
                }
            end
        end
    end
}

SMODS.Joker {
    key = "scam",
    atlas = 'Jokers',
    pos = { x = 1, y = 7 },
    rarity = 1,
    blueprint_compat = true,
    cost = 6,
    config = { extra = { odds = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if pseudorandom('balf_scam') < G.GAME.probabilities.normal / card.ability.extra.odds then
                ease_dollars(0-G.GAME.dollars*0.5)
            else
                ease_dollars(G.GAME.dollars)
            end
        end
    end
}

SMODS.Joker {
    key = "batpeg",
    atlas = 'Jokers',
    pos = { x = 2, y = 7 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    config = { extra = { money = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,
    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            ease_dollars(card.ability.extra.money)
        end
    end
}

SMODS.Joker {
    key = "ai",
    atlas = 'Jokers',
    pos = { x = 3, y = 7 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    config = { extra = { xmult = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return { Xmult_mod = card.ability.extra.xmult,
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } } 
                }
        end
        if context.setting_blind then
			if G.GAME.blind.name == 'Cerulean Bell' then -- disables cerulean bell to avoid conflict
				G.GAME.blind:disable()
			end
		end
        if context.first_hand_drawn and not context.blueprint then
			G.E_MANAGER:add_event(Event({
				func = function() 
					card:juice_up(0.8, 0.5)
					local any_forced = nil
					for k, v in ipairs(G.hand.cards) do
						if v.ability.forced_selection then
							any_forced = true
						end
					end
					if not any_forced then 
						G.hand:unhighlight_all()
                        local i = 1
                        while i < 6 do
                            local yourcards = {}
                            for  k, v in pairs(G.hand.cards) do
                                if not v.ability.forced_selection then
                                    table.insert(yourcards, v)
                                end
                            end
                            local cardforce = pseudorandom_element(yourcards, pseudoseed('random_force'))
                            cardforce.ability.forced_selection = true
                            G.hand:add_to_highlighted(cardforce)
                            i = i+1
                        end
					end
				return true
			end}))
		end
		if (context.after or context.pre_discard) and #G.hand.cards > 0 and not context.blueprint then
			G.E_MANAGER:add_event(  -- Thanks WilsontheWolf apparently
				Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						if G.STATE ~= G.STATES.SELECTING_HAND then
							return false
						end
						G.STATE = G.STATES.HAND_PLAYED
						G.STATE_COMPLETE = true
							G.E_MANAGER:add_event(Event({
								func = function() 
									local any_forced = nil
					for k, v in ipairs(G.hand.cards) do
						if v.ability.forced_selection then
							any_forced = true
						end
					end
					if not any_forced then 
						G.hand:unhighlight_all()
                        local i = 1
                        while i < 6 do
                            local yourcards = {}
                            for  k, v in pairs(G.hand.cards) do
                                if not v.ability.forced_selection then
                                    table.insert(yourcards, v)
                                end
                            end
                            local cardforce = pseudorandom_element(yourcards, pseudoseed('random_force'))
                            cardforce.ability.forced_selection = true
                            G.hand:add_to_highlighted(cardforce)
                            i = i+1
                        end
					end
				return true
				end}))
		    	G.STATE = G.STATES.SELECTING_HAND
				card:juice_up(0.8, 0.5)
			return true
	    	end,
		}),
		"other")
		end
    end
}
-- code is a modified version from buffoonery's partonizing joker since it's essentially the same exact functionality, thank PinkMaggit for this one

SMODS.Joker {
    key = "chris",
    atlas = 'Jokers',
    pos = { x = 3, y = 6 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = (G.GAME.current_round.discards_left + G.GAME.current_round.hands_left)
            }
        end
    end
}

SMODS.Joker {
    key = "maxdesignpro",
    atlas = 'Jokers',
    pos = { x = 5, y = 7 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    config = { extra = { chips = 0, chipgain = 0.1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chipgain } }
    end,
    calculate = function(self, card, context)
        if context.balf_press then
            if card.states.hover.is == true then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipgain
                card:juice_up(0.2,0.6)
            end
        end
        if context.joker_main then
            return{
                chips = card.ability.extra.chips
            }
        end
    end
}

SMODS.Joker {
    key = "waveify",
    atlas = 'Jokers',
    pos = { x = 6, y = 7 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos and G.jokers.cards[my_pos + 1] and not G.jokers.cards[my_pos + 1].ability.eternal and not G.jokers.cards[my_pos + 1].getting_sliced then
                local sliced_card = G.jokers.cards[my_pos + 1]
                sliced_card.getting_sliced = true
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        ease_dollars(sliced_card.sell_cost * 3)
                        card:juice_up(0.8, 0.8)
                        sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                        play_sound('slice1', 0.96 + math.random() * 0.08)
                        return true
                    end
                }))
                return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { sliced_card.sell_cost *3 } },
                    colour = G.C.MONEY,
                    no_juice = true
                }
            end
        end
    end
}

SMODS.Joker {
    key = "teeth",
    atlas = 'Jokers',
    pos = { x = 4, y = 7 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    config = { extra = { discard = 3, remove = false } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.discard } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discard
            ease_discard(card.ability.extra.discard)
            if card.ability.extra.discard < 2 then
                card.ability.extra.remove = true
            end
        end
        if context.end_of_round and context.game_over == false then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - (card.ability.extra.discard)
            ease_discard(-(card.ability.extra.discard))
            card.ability.extra.discard = card.ability.extra.discard-1
            if card.ability.extra.remove == true then
                card:start_dissolve()
            end
        end
    end
}

SMODS.Joker {
    key = "tyronne",
    atlas = 'Jokers',
    pos = { x = 7, y = 6 },
    rarity = 1,
    blueprint_compat = false,
    cost = 5,
    config = { extra = { chips = 0, chipmod = 10 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chipmod } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if context.scoring_name ~= 'Straight' then
                card.ability.extra.chips = card.ability.extra.chips+card.ability.extra.chipmod
            end
            return{
                chips = card.ability.extra.chips
            }
        end
    end
}

SMODS.Joker {
    key = "walter",
    atlas = 'Jokers',
    pos = { x = 1, y = 6 },
    rarity = 1,
    blueprint_compat = false,
    cost = 5,
    calculate = function(self, card, context)
        if context.check_enhancement then
            if context.other_card.base.suit == "Clubs" then
                return {m_lucky = true}
            end
        end
    end
}

SMODS.Joker {
    key = "grimace",
    atlas = 'Jokers',
    pos = { x = 9, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 6,
    config = { extra = { chips = 10, inc = 10 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.inc } }
    end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == context.full_hand[#context.full_hand] then
            for _, discarded_card in ipairs(context.full_hand) do
                discarded_card.ability.perma_bonus = discarded_card.ability.perma_bonus or 0
                discarded_card.ability.perma_bonus = discarded_card.ability.perma_bonus + card.ability.extra.chips
            end
        end
        if context.end_of_round and context.game_over == false and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.inc
            if card.ability.extra.chips > 50 then
                card:start_dissolve()
            end
        end
    end
}

SMODS.Joker {
    key = "watermelon",
    atlas = 'Jokers',
    pos = { x = 10, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    config = { extra = { mult = 30 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and G.GAME.blind.boss and context.game_over == false and not context.blueprint then
            card:start_dissolve()
        end
    end
}

SMODS.Joker {
    key = "check_it",
    atlas = 'Jokers',
    pos = {x = 9, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    pixel_size = { h = 94, w = 51 },
    config = { extra = { odds = 6, xmult = 4, nxmult = 0.5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.xmult, card.ability.extra.nxmult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if pseudorandom('balf_check_it') < G.GAME.probabilities.normal / card.ability.extra.odds then
                return {
                    xmult = card.ability.extra.xmult
                }
            else
                return {
                    xmult = card.ability.extra.nxmult
                }
            end
        end
    end
}

SMODS.Joker {
    key = "toucher",
    atlas = 'Jokers',
    pos = {x = 10, y = 1 },
    rarity = 1,
    blueprint_compat = false,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { colours = {HEX("7A5FCE")} } }
    end,
    calculate = function(self, card, context)
        if context.selling_self then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos and G.jokers.cards[my_pos + 1] and not G.jokers.cards[my_pos + 1].getting_sliced then
                G.jokers.cards[my_pos + 1]:add_sticker("balf_touched", true)
                return {
				        message = localize('k_ems'),
				        colour = G.C.PURPLE,
			        }
            end
        end
    end
}

SMODS.Joker {
    key = "gflash",
    atlas = 'Jokers',
    pos = { x = 12, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    config = { extra = { repetitions = 1 } },
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            local suits = {
                ['Diamonds'] = 0,
                ['Clubs'] = 0
            }
            for i = 1, #context.scoring_hand do
                if not SMODS.has_any_suit(context.scoring_hand[i]) then
                    elseif context.scoring_hand[i]:is_suit('Diamonds', true) and suits["Diamonds"] == 0 then
                        suits["Diamonds"] = suits["Diamonds"] + 1
                    elseif context.scoring_hand[i]:is_suit('Clubs', true) and suits["Clubs"] == 0 then
                        suits["Clubs"] = suits["Clubs"] + 1
                    end
                end
            for i = 1, #context.scoring_hand do
                if SMODS.has_any_suit(context.scoring_hand[i]) then
                    elseif context.scoring_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0 then
                        suits["Diamonds"] = suits["Diamonds"] + 1
                    elseif context.scoring_hand[i]:is_suit('Clubs') and suits["Clubs"] == 0 then
                        suits["Clubs"] = suits["Clubs"] + 1
                    end
                end
            if suits["Diamonds"] > 0 and
                suits["Clubs"] > 0 then
                if context.other_card:is_suit('Clubs') or context.other_card:is_suit('Diamonds') then
                    return {
                        repetitions = card.ability.extra.repetitions
                    }
                end
            end
        end
    end
}

SMODS.Joker {
    key = "tables",
    atlas = 'Jokers',
    pos = { x = 14, y = 1 },
    rarity = 1,
    blueprint_compat = false,
    cost = 5,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands['Four of a Kind']) then
            context.scoring_hand[1]:set_ability('m_balf_plank', nil, true)
        end
    end
}

SMODS.Joker {
    key = "crash",
    atlas = 'Jokers',
    pos = { x = 15, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    calculate = function(self, card, context)
        if context.check_enhancement then
            if context.other_card.config.center == G.P_CENTERS.m_balf_scrap then
                return {m_steel = true, m_gold = true}
            end
        end
    end
}

SMODS.Joker {
    key = "opportunity",
    atlas = 'Jokers',
    pos = { x = 9, y = 2 },
    rarity = 1,
    blueprint_compat = false,
    cost = 5,
    config = { extra = { up = false } },
    calculate = function(self, card, context)
        if card.ability.extra.up == false and G.GAME.blind.boss and not context.blueprint then
            for k, v in pairs(G.GAME.probabilities) do
                G.GAME.probabilities[k] = v * 3
            end
            card.ability.extra.up = true
        end
        if card.ability.extra.up == true and context.end_of_round and G.GAME.blind.boss and not context.blueprint then
            for k, v in pairs(G.GAME.probabilities) do
                G.GAME.probabilities[k] = v / 3
            end
            card.ability.extra.up = false
        end
        if card.ability.extra.up == true and not G.GAME.blind.boss and not context.blueprint then
            for k, v in pairs(G.GAME.probabilities) do
                G.GAME.probabilities[k] = v / 3
            end
            card.ability.extra.up = false
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.up == true then
            for k, v in pairs(G.GAME.probabilities) do
                G.GAME.probabilities[k] = v / 3
            end
        end
    end
}

SMODS.Joker {
    key = "placeholder",
    atlas = 'Jokers',
    pos = { x = 7, y = 7 },
    rarity = 1,
    blueprint_compat = true,
    cost = 4,
    config = { extra = { chips = 40 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.chips
            }
        end
    end
}

-- UNCOMMON

SMODS.Joker {
    key = "logspam",
    atlas = 'Jokers',
    pos = { x = 8, y = 3 },
    rarity = 2,
    blueprint_compat = true,
    cost = 6,
    config = { extra = { xchips = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xchips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card.config.center == G.P_CENTERS.m_balf_plank then
            return {
                xchips = card.ability.extra.xchips
            }
        end
    end
}

SMODS.Joker {
    key = "spamton",
    atlas = 'Jokers',
    pos = { x = 15, y = 2 },
    rarity = 2,
    blueprint_compat = true,
    cost = 5,
    config = { extra = { repetitions = math.ceil(1.997), og = "1.997" } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.og, localize((G.GAME.current_round.balf_spam_card or {}).rank or 'Ace', 'ranks') } }
    end,
    calculate = function(self, card, context)
         if context.repetition and context.cardarea == G.play and context.other_card:get_id() == G.GAME.current_round.balf_spam_card.id then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
    end

}

local function reset_balf_spam_rank()
    G.GAME.current_round.balf_spam_card = { rank = 'Ace' }
    local valid_spam_cards = {}
    for _, playing_card in ipairs(G.playing_cards) do
        if not SMODS.has_no_rank(playing_card) then
            valid_spam_cards[#valid_spam_cards + 1] = playing_card
        end
    end
    local spam_card = pseudorandom_element(valid_spam_cards, pseudoseed('balf_spam' .. G.GAME.round_resets.ante))
    if spam_card then
        G.GAME.current_round.balf_spam_card.rank = spam_card.base.value
        G.GAME.current_round.balf_spam_card.id = spam_card.base.id
    end
end

SMODS.Joker {
    key = "IOU",
    atlas = 'Jokers',
    pos = { x = 11, y = 2 },
    rarity = 2,
    blueprint_compat = false,
    cost = 5,
    config = { extra = { up = true } },
    calculate = function(self, card, context)
        if context.starting_shop and card.ability.extra.up == true and G.shop_jokers and G.shop_booster then 
            for k, v in pairs(G.shop_jokers.cards) do
                v.ability.couponed = true
                v.ability.IOU = true
                v:set_cost()
            end
            for k, v in pairs(G.shop_booster.cards) do
                v.ability.couponed = true
                v.ability.IOU = true
                v:set_cost()
            end
        end
        if context.buying_card and G.shop_jokers and context.card.ability.IOU == true then
            card.ability.extra.up = false
            for k, v in pairs(G.shop_jokers.cards) do
                v.ability.couponed = false
                v.ability.IOU = false
                v:set_cost()
            end
            for k, v in pairs(G.shop_booster.cards) do
                v.ability.couponed = false
                v.ability.IOU = false
                v:set_cost()
            end
        end
        if context.end_of_round and G.GAME.blind.boss and context.game_over == false and not context.blueprint then
            card.ability.extra.up = true
        end
    end
}

SMODS.Joker {
    key = "balf",
    atlas = 'Jokers',
    pos = { x = 10, y = 2 },
    rarity = 2,
    blueprint_compat = true,
    cost = 5,
    pixel_size = { h = 34, w = 34 },
    config = { extra = { mult = 0, gain = 6 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.gain } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local gains = 0
            for _, joker in ipairs(G.jokers.cards) do
                if joker ~= card and string.find(joker.config.center_key, "balf", 1, true) then
                    gains = gains + card.ability.extra.gain
                end
            end
            card.ability.extra.mult = 0
            card.ability.extra.mult = gains
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Joker {
    key = "gummies",
    atlas = 'Jokers',
    pos = { x = 12, y = 0 },
    rarity = 2,
    blueprint_compat = true,
    cost = 7,
    config = { extra = { mult = 4, count = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, (4-card.ability.extra.count) } }
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            for _, scored_card in ipairs(context.scoring_hand) do
                scored_card.ability.perma_mult = scored_card.ability.perma_mult or 0
                scored_card.ability.perma_mult = scored_card.ability.perma_mult + card.ability.extra.mult
            end
            return {
				        message = localize('k_gummies'),
				        colour = G.C.Enhanced,
			        }
        end
        if context.end_of_round then
            card.ability.extra.count = card.ability.extra.count+1
            if card.ability.extra.count == 4 then
                card:start_dissolve()
            end
        end
    end
}

SMODS.Joker {
    key = "surprise",
    atlas = 'Jokers',
    pos = { x = 11, y = 0 },
    rarity = 2,
    blueprint_compat = true,
    cost = 6,
    config = { extra = { xmult = 4, count = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, (2-card.ability.extra.count) } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.blind.boss then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.end_of_round and G.GAME.blind.boss and context.game_over == false and not context.blueprint then
            card.ability.extra.count = card.ability.extra.count+1
            if card.ability.extra.count == 2 then
                card:start_dissolve()
            end
        end
    end
}

SMODS.Joker {
    key = "grilled",
    atlas = 'Jokers',
    pos = { x = 8, y = 0 },
    rarity = 2,
    blueprint_compat = false,
    cost = 7,
    config = { extra = { odds = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and G.GAME.blind.boss and context.game_over == false and not context.blueprint then
            if pseudorandom('balf_grilled') < G.GAME.probabilities.normal / card.ability.extra.odds then
                ease_ante(-1)
                card:start_dissolve()
            end
        end
    end
}

balf.probablityStorage = {}

SMODS.Joker {
    key = "aids",
    atlas = 'Jokers',
    pos = { x = 3, y = 1 },
    rarity = 2,
    blueprint_compat = true,
    cost = 6,
    config = { extra = { buffer = 0 }, },
    add_to_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            balf.probablityStorage[k] = G.GAME.probabilities[k]
            G.GAME.probabilities[k] = 0
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = balf.probablityStorage[k]
            if G.GAME.probabilities[k] == nil then G.GAME.probabilities[k] = 1 end
        end
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not G.GAME.blind.boss and not context.blueprint then
            local destroy = false
            if card.ability.extra.buffer == 1 then
                destroy = true
                card.ability.extra.buffer = 0
            else
                card.ability.extra.buffer = 1
            end
            if destroy then
                card:start_dissolve()
            end
        end
        if context.end_of_round and context.game_over == false then
            card.ability.extra.buffer = 0
        end
    end,
}

SMODS.Joker {
    key = "richard",
    atlas = 'Jokers',
    pos = { x = 2, y = 6 },
    rarity = 2,
    blueprint_compat = false,
    cost = 5,
    calculate = function(self, card, context)
         if context.before and context.main_eval and G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 then
            local cc = 0
            while cc < 3 do
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copy_card = copy_card(context.full_hand[1], nil, nil, G.playing_card)
                copy_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, copy_card)
                G.hand:emplace(copy_card)
                copy_card.states.visible = nil
                cc = cc+1
                copy_card:start_materialize()
            end
            card:start_dissolve()
        end
    end
}

SMODS.Joker {
    key = "gravity",
    atlas = 'Jokers',
    pos = { x = 13, y = 0 },
    rarity = 2,
    blueprint_compat = false,
    cost = 7,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.blind.boss and next(context.poker_hands["Pair"]) then
            return {
                level_up = true,
                level_up_hand = pair
            }
        end
    end
}

SMODS.Joker {
    key = "acecards",
    atlas = 'Jokers',
    pos = { x = 6, y = 5 },
    rarity = 2,
    blueprint_compat = true,
    cost = 5,
    config = { extra = { xmultbase = 1, xmult = 0.25 } },
    loc_vars = function(self, info_queue, card)
        local ace_tally = 0
        if G.playing_card then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:get_id() == 14 then ace_tally = ace_tally +1 end
            end
        end
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmultbase, card.ability.extra.xmultbase + (card.ability.extra.xmult * ace_tally) } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local ace_tally = 0
        if G.playing_card then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:get_id() == 14 then ace_tally = ace_tally +1 
                end
            end
        end
        return {
                Xmult_mod = card.ability.extra.xmultbase + (card.ability.extra.xmult * ace_tally),
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmultbase + (card.ability.extra.xmult * ace_tally) } }
            }
        end
    end
}

SMODS.Joker {
    key = "dispenser",
    atlas = 'Jokers',
    pos = { x = 0, y = 7 },
    rarity = 2,
    blueprint_compat = false,
    cost = 7,
    calculate = function(self, card, context)
        if context.check_enhancement then
            if context.other_card.config.center == G.P_CENTERS.m_gold then
                    return {m_steel = true}
            end
            if context.other_card.config.center == G.P_CENTERS.m_steel then
                    return {m_gold = true}
            end
        end
    end
}

SMODS.Joker {
    key = "davis",
    atlas = 'Jokers',
    pos = { x = 0, y = 0 },
    rarity = 2,
    blueprint_compat = false,
    cost = 8,
                calculate = function(self, card, context)
                    if context.cardarea == G.play and context.individual and not context.blueprint then
                        -- just the basic "Hey, hand is getting played", this is mostly a note for my future 
                        -- self cause i well know that im gonna forget that this is just the basics and try to 
                        -- research whatever the hell i did
                        local cseal = context.other_card:get_seal()  
                        -- GET THAT SEAL BOY
                        if cseal ~= nil then
                            for _, scored_card in ipairs(context.scoring_hand) do
                                if scored_card.seal == nil then
                                scored_card:set_seal(cseal) 
                                -- . instead of : i genuinely cant believe that took 3 hours to find
                                return {
                                message = localize('k_seal'),
                                colour = G.C.RED
                                }
                                end
                                end
                            end
                        end
                    end
}

-- this was the first coded joker i cannot believe this shit took so long looking back at it

SMODS.Joker {
    key = "charlie",
    atlas = 'Jokers',
    pos = { x = 3, y = 2 },
    rarity = 2,
    blueprint_compat = true,
    cost = 4,
    config = { extra = { mult = 8, suit = 'Clubs' } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, localize(card.ability.extra.suit, 'suits_singular') } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual and context.other_card:is_suit((card.ability.extra.suit)) then
            context.other_card.destroy = true
            return {
                mult = card.ability.extra.mult,
            }
        end
        if context.after then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card.destroy ~= nil then 
                    playing_card:remove()
                end
            end
        end
    end
}

SMODS.Joker {
    key = "dudey",
    atlas = 'Jokers',
    pos = { x = 4, y = 0 },
    rarity = 2,
    blueprint_compat = true,
    cost = 6,
    config = { extra = { booster = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.booster } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.modifiers.booster_choice_mod = (G.GAME.modifiers.booster_choice_mod or 0) + card.ability.extra.booster
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.modifiers.booster_choice_mod = (G.GAME.modifiers.booster_choice_mod or 0) - card.ability.extra.booster
    end
}

SMODS.Joker {
    key = "maddyx",
    atlas = 'Jokers',
    pos = { x = 5, y = 0 },
    rarity = 2,
    blueprint_compat = true,
    cost = 5,
    add_to_deck = function(self, card, from_debuff)
		SMODS.change_voucher_limit(1)
	end,
    remove_from_deck = function(self, card, from_debuff)
		SMODS.change_voucher_limit(-1)
	end,
}

SMODS.Joker {
    key = "yuri",
    atlas = 'Jokers',
    pos = { x = 5, y = 5 },
    rarity = 2,
    blueprint_compat = true,
    cost = 6,
    config = { extra = { buffer = 0, mode = "Active!" } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.buffer, card.ability.extra.mode } }
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Planet' then
            if card.ability.extra.buffer == 0 then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    card.ability.extra.mode = "Inactive"
                    card.ability.extra.buffer = card.ability.extra.buffer +1
                    gen = context.consumeable
                    G.E_MANAGER:add_event(Event({
                            func = (function()
                            SMODS.add_card {
                                key = gen.config.center_key
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end)
                    }))
                end
            else
                card.ability.extra.buffer = 0
                card.ability.extra.mode = "Active!"
            end
        end
    end
}

SMODS.Joker {
    key = "charles",
    atlas = 'Jokers',
    pos = { x = 4, y = 6 },
    rarity = 2,
    blueprint_compat = true,
    cost = 7,
    config = { extra = { chips = 50 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.final_scoring_step then
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card.config.center == G.P_CENTERS.m_stone then
                    scored_card.ability.perma_bonus = scored_card.ability.perma_bonus or 0
                    scored_card.ability.perma_bonus = scored_card.ability.perma_bonus + card.ability.extra.chips
                end
            end
        end
    end
}

SMODS.Joker {
    key = "myname",
    atlas = 'Jokers',
    pos = { x = 5, y = 6 },
    rarity = 2,
    blueprint_compat = true,
    cost = 6,
    config = { extra = { xmult = 1.5, question = false } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.question } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local length = string.len(string.lower(G.PROFILES[G.SETTINGS.profile].name))
            local a = 1
            while a ~= (length+1) do
                local temp = string.sub(string.lower(G.PROFILES[G.SETTINGS.profile].name), a, a)
                a = a+1
                if temp == "z" or temp == "t" or temp == "c" then
                    card.ability.extra.question = true
                    break
                end
            end
            if card.ability.extra.question == true then
                return {
                    Xmult_mod = card.ability.extra.xmult,
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
                    play_sound('balf_mynameis', 0.9 + math.random() * 0.1, 0.8),
                }
            end
        end
    end
}

SMODS.Joker {
    key = "starwalker",
    atlas = 'Jokers',
    pos = { x = 8, y = 1 },
    rarity = 2,
    blueprint_compat = true,
    cost = 6,
    config = { extra = { repetitions = 1, suit = 'Diamonds' } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.repetitions, localize(card.ability.extra.suit, 'suits_singular') } }
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card:is_suit((card.ability.extra.suit)) then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
    end
}

SMODS.Joker {
    key = "neighbour",
    atlas = 'Jokers',
    pos = { x = 11, y = 1 },
    rarity = 2,
    blueprint_compat = true,
    cost = 7,
    config = { extra = { retriggers = 1, lor = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.retriggers } }
    end,
    calculate = function(self, card, context)
        local my_pos
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        if context.final_scoring_step or context.setting_blind or context.end_of_round then
            card.ability.extra.lor = math.random(1,2)
        end
        local check = card.ability.extra.lor
        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
            if check == 1 then
                if context.other_card == G.jokers.cards[my_pos - 1] then
                    return {
                        message = localize("k_again_ex"),
                        repetitions = (card.ability.extra.retriggers),
                        card = card,
                    }
                else
                    return nil, true
                end
            else
                if context.other_card == G.jokers.cards[my_pos + 1] then
                    return {
                        message = localize("k_again_ex"),
                        repetitions = (card.ability.extra.retriggers),
                        card = card,
                    }
                else
                    return nil, true
                end
            end
        end
    end
}

SMODS.Joker {
    key = "sienna",
    atlas = 'Jokers',
    pos = { x = 1, y = 0 },
    rarity = 2,
    blueprint_compat = true,
    cost = 5,
    config = { extra = { suit = 'Hearts'} },
    loc_vars = function(self, info_queue, card)
        return { vars = { localize(card.ability.extra.suit, 'suits_singular') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_played == 0 and next(context.poker_hands["Flush"]) and
        context.poker_hands["Flush"][1][1]:is_suit((card.ability.extra.suit)) then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                    SMODS.add_card {
                        set = 'Tarot',
                        key = 'c_fool'
                    }
                    G.GAME.consumeable_buffer = 0
                    return true
                    end)
                }))
                return {
                    message = localize('k_plus_tarot'),
                    colour = G.C.SECONDARY_SET.Tarot,
                    remove = true
                }
                end
            end
    end
}

SMODS.Joker {
    key = "togore",
    atlas = 'Jokers',
    pos = { x = 13, y = 1 },
    rarity = 2,
    blueprint_compat = false,
    cost = 6,
    config = { extra = { rerolls = 3, rhold = false } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.rerolls } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if G.GAME.last_hand_played == "High Card" then
                SMODS.change_free_rerolls(card.ability.extra.rerolls)
                card.ability.extra.rhold = true
                return {
				        message = localize('k_togore'),
				        colour = G.C.GREEN,
			        }
            elseif card.ability.extra.rhold == true then
                SMODS.change_free_rerolls(-card.ability.extra.rerolls)
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.rerolls == true then
            SMODS.change_free_rerolls(-card.ability.extra.rerolls)
        end
    end
}

-- SHOUTOUT TO THIS N GUY ON THE BALATRO DISCORD SERVER, was gonna fully use his code but it wasnt really compatible with all the pizzazz i needed
-- i did tho however take the context.poker_hands flush method which while it's a nerf to sienna it GREATLY helps coding this bs, thing below is something i tested containing his code.

--    calculate = function(self, card, context)
--        if context.joker_main and next(context.poker_hands["Flush"]) and context.poker_hands["Flush"][1][1]:is_suit("Hearts") and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and G.GAME.current_round.hands_played == 0 then
 --           SMODS.add_card{key="c_fool", edition = next(context.poker_hands["Flush Five"]) and "e_negative" or nil}
  --          G.GAME.consumeable_buffer = 0
   --         return {message = localize('k_plus_tarot'), colour = G.C.SECONDARY_SET.Tarot, remove = true}
    --    end
     -- end

SMODS.Joker {
    key = "lemons",
    atlas = 'Jokers',
    pos = { x = 12, y = 2 },
    rarity = 2,
    blueprint_compat = false,
    cost = 6,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_left == 0 then
            context.scoring_hand[1]:set_edition('e_negative', nil, true)
        end
    end
}

-- RARE

SMODS.Joker {
    key = "batter",
    atlas = 'Jokers',
    pos = { x = 9, y = 3 },
    rarity = 3,
    blueprint_compat = true,
    cost = 8,
    config = { extra = { cards_destroyed = 0, xmult_gain = 0.25, xmult = 1 } },
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.cards_destroyed, card.ability.extra.xmult_gain, card.ability.extra.xmult } }
	end,
    calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers and #G.hand.cards > 0 and not context.blueprint then
			local Bcard = pseudorandom_element(G.hand.cards, pseudoseed('batter'))
            card.ability.extra.cards_destroyed = card.ability.extra.cards_destroyed+1
            card.ability.extra.xmult = card.ability.extra.xmult+(card.ability.extra.cards_destroyed*card.ability.extra.xmult_gain)
            G.E_MANAGER:add_event(Event({
                func = function()
                    if SMODS.has_enhancement(Bcard, "m_glass") then
                        Bcard:shatter()
                    else
                        Bcard:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                    end
                    play_sound('slice1', 0.96 + math.random() * 0.08)
                    card:juice_up(0.9, 0.8)
                    return true
                end
            }))
		elseif context.joker_main then
        	return {
        		xchips = card.ability.extra.xmult
        	}
	    end
	end
}

SMODS.Joker {
    key = "member",
    atlas = 'Jokers',
    pos = { x = 13, y = 2 },
    rarity = 3,
    blueprint_compat = false,
    cost = 6,
    config = { extra = { mult = 19, allowed = false } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.allowed } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local test = 0
            for _, joker in ipairs(G.jokers.cards) do
                if joker ~= card and string.find(joker.config.center_key, "balf", 1, true) then
                    test = test+1
                    card.ability.extra.allowed = true
                    break
                end
            end
            if test == 0 then 
                card.ability.extra.allowed = false 
                print (card.ability.extra.allowed)
            end
            if card.ability.extra.allowed == true then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}

SMODS.Joker {
    key = "guardian",
    atlas = 'Jokers',
    pos = { x = 14, y = 2 },
    rarity = 3,
    blueprint_compat = false,
    cost = 8,
    config = { extra = { retry = true, suit = 'Spades' } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.suit, colours = { G.C.SUITS[card.ability.extra.suit] } } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            local guardian_suits = { 'Spades', 'Hearts', 'Clubs', 'Diamonds' }
            local guardian_suit = pseudorandom_element(guardian_suits, pseudoseed('balf_guardian'))
            card.ability.extra.suit = guardian_suit
            if G.playing_card then
                while card.ability.extra.retry == true do
                    for _, playing_card in ipairs(G.playing_cards) do
                        if playing_card:is_suit((card.ability.extra.suit)) then
                            playing_card:remove()
                        end
                    end
                    card.ability.extra.retry = false
                    for _, playing_card in ipairs(G.playing_cards) do
                        if playing_card:is_suit((card.ability.extra.suit)) then 
                            card.ability.extra.retry = true
                        end
                    end
                end
            end
            return { card:start_dissolve(), }
        end
    end
}

SMODS.Joker {
    key = "frost",
    atlas = 'Jokers',
    pos = { x = 0, y = 1 },
    rarity = 3,
    blueprint_compat = false,
    cost = 7,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            for _, scored_card in ipairs(context.scoring_hand) do
                scored_card:set_ability('m_balf_frozen', nil, true)
            end
            return {
				        message = localize('k_frost'),
				        colour = G.C.Enhanced,
			        }
        end
    end
}

SMODS.Joker {
    key = "sol",
    atlas = 'Jokers',
    pos = { x = 8, y = 2 },
    rarity = 3,
    blueprint_compat = true,
    cost = 7,
    config = { extra = { h_size = 0, gain = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.h_size, card.ability.extra.gain } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and G.GAME.blind.boss and context.game_over == false and not context.blueprint then
            G.hand:change_size(-card.ability.extra.h_size)
            card.ability.extra.h_size = card.ability.extra.h_size + card.ability.extra.gain
            G.hand:change_size(card.ability.extra.h_size)
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,
}

SMODS.Joker {
    key = "greg",
    atlas = 'Jokers',
    pos = { x = 3, y = 4 },
    rarity = 3,
    blueprint_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
    return { vars = { colours = {HEX("62FFFF")} } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            local goop_card = create_playing_card({ center = G.P_CENTERS.m_balf_goop }, G.discard, true, false,
                nil, true)
            G.E_MANAGER:add_event(Event({
                func = function()
                    goop_card:start_materialize({ G.C.SECONDARY_SET.Enhanced })
                    G.play:emplace(goop_card)
                    return true
                end
            }))
            return {
                message = localize('k_plus_goop'),
                colour = G.C.SECONDARY_SET.Enhanced,
                func = function() -- This is for timing purposes, everything here runs after the message
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            return true
                        end
                    }))
                    draw_card(G.play, G.deck, 90, 'up')
                    SMODS.calculate_context({ playing_card_added = true, cards = { goop_card } })
                end
            }
        end
    end
}

SMODS.Joker {
    key = "nokaru",
    atlas = 'Jokers',
    pos = { x = 7, y = 5 },
    rarity = 3,
    blueprint_compat = false,
    cost = 6,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then 
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card.seal == nil then
                    scored_card:set_seal("balf_orb", nil, true) 
                end
            end
            return {
                message = localize('k_seal'),
                colour = G.C.UI.TEXT_DARK
            }
        end
        if context.repetition and context.cardarea == G.play and context.other_card:get_seal() == 'balf_orb' then
            if context.other_card.ability.orb == nil then
                context.other_card.ability.orb = math.random(1, 4)
            end
            if context.other_card.ability.orb == 1 then
                if context.repetition then
                    return {
                        repetitions = 1,
                    }
                end
            end
        end
        if context.cardarea == G.play and context.individual and context.other_card:get_seal() == 'balf_orb' and context.other_card.ability.orb == 3 then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + 3
            return {
                dollars = 3,
                    func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
        if context.end_of_round and context.cardarea == G.hand and context.other_card:get_seal() == 'balf_orb' then
            if context.other_card.ability.orb == nil then
                context.other_card.ability.orb = math.random(1, 4)
            end
            if context.other_card.ability.orb == 2 and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = function()
                        if G.GAME.last_hand_played then
                            local _planet = nil
                            for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                                if v.config.hand_type == G.GAME.last_hand_played then
                                    _planet = v.key
                                end
                            end
                            if _planet then
                                SMODS.add_card({ key = _planet })
                            end
                            G.GAME.consumeable_buffer = 0
                        end
                        return true
                    end
                }))
                return { message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet }
            end
        end
        if context.discard and context.other_card:get_seal() == 'balf_orb' and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if context.other_card.ability.orb == nil then
                context.other_card.ability.orb = math.random(1, 4)
            end
            if context.other_card.ability.orb == 4 then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = function()
                        SMODS.add_card({ set = 'Tarot' })
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
                return { message = localize('k_plus_tarot'), colour = G.C.PURPLE }
            end
        end
    end
}

SMODS.Joker {
    key = "tanaka",
    atlas = 'Jokers',
    pos = { x = 1, y = 1 },
    rarity = 3,
    blueprint_compat = true,
    cost = 9,
    config = { extra = { mult = 0, xmult = 1, chips = 0, dollars = 0, h_size = 0, cola = false, grilled = -1, extramult = 0, extrachips = 0, seltzer = 0, teeth = 0, egg = 0, turtle = 0, xmultboss = 0} },
    calculate = function(self, card, context)
        if not context.blueprint and context.balf and context.balf.destroying_joker then
            if balf.lastSliced.config.center_key == "j_cavendish" then
                self.ability.extra.xmult = self.ability.extra.xmult +3
            elseif balf.lastSliced.config.center_key == "j_gros_michel" then
                card.ability.extra.mult = card.ability.extra.mult + 15
            elseif balf.lastSliced.config.center_key == "j_popcorn" then
                card.ability.extra.mult = card.ability.extra.mult + 20
            elseif balf.lastSliced.config.center_key == "j_ramen" then
                card.ability.extra.mult = card.ability.extra.xmult + 2
            elseif balf.lastSliced.config.center_key == "j_ice_cream" then
                card.ability.extra.chips = card.ability.extra.chips + 100
            elseif balf.lastSliced.config.center_key == "j_selzter" then
                card.ability.extra.seltzer = card.ability.extra.seltzer + 1
            elseif balf.lastSliced.config.center_key == "j_turtle_bean" then
                card.ability.extra.turtle = card.ability.extra.turtle + 5
            elseif balf.lastSliced.config.center_key == "j_balf_teeth" then
                card.ability.extra.teeth = card.ability.extra.teeth + 3
            elseif balf.lastSliced.config.center_key == "j_balf_watermelon" then
                card.ability.extra.mult = card.ability.extra.mult + 30
            elseif balf.lastSliced.config.center_key == "j_balf_grimace" then
                card.ability.extra.extrachips = card.ability.extra.extrachips + 60
            elseif balf.lastSliced.config.center_key == "j_balf_gummies" then
                card.ability.extra.extramult = card.ability.extra.extramult + 4
            elseif balf.lastSliced.config.center_key == "j_balf_surprise" then
                card.ability.extra.xmultboss = card.ability.extra.xmultboss + 4
            elseif balf.lastSliced.config.center_key == "j_balf_grilled" then
                if card.ability.extra.grilled == -1 then
                    card.ability.extra.grilled = card.ability.extra.grilled + 5
                elseif card.ability.extra.grilled > 1 then
                    card.ability.extra.grilled = card.ability.extra.grilled/2
                end
            end
        elseif not context.blueprint and context.balf and context.balf.joker_sold then
            if balf.lastSold.config.center_key == "j_diet_cola" then
                card.ability.extra.cola = true
            elseif balf.lastSold.config.center_key == "j_egg" then
                card.ability.extra.egg = card.ability.extra.egg +3
            end
        elseif context.joker_main then
            local xm = card.ability.extra.xmult
            if G.GAME.blind.boss then
                xm = card.ability.extra.xmult + card.ability.extra.xmultboss
            end
            if xm < 1 then
                xm = 1
            end
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips,
                Xmult_mod = xm,
                message = localize { type = 'variable', key = 'a_xmult', vars = { xm } } ,
            }
        elseif context.selling_self then
            if card.ability.extra.cola == true then
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                                add_tag(Tag('tag_double'))
                                play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                                play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                                return true
                            end)
                        }))
                    end
                }
            end
        elseif context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.egg > 0 then
                card.ability.extra_value = card.ability.extra_value + card.ability.extra.egg
                card:set_cost()
                return {
                    message = localize('k_val_up'),
                    colour = G.C.MONEY
                }
            end
            if card.ability.extra.teeth > 0 then
                G.GAME.round_resets.discards = G.GAME.round_resets.discards - (card.ability.extra.teeth)
                ease_discard(-(card.ability.extra.teeth))
            end
            if card.ability.extra.grilled > -1 and G.GAME.blind.boss then
                if pseudorandom('balf_grilled') < G.GAME.probabilities.normal / card.ability.extra.grilled then
                    ease_ante(-1)
                    card:start_dissolve()
                end
            end
        elseif context.repetition and context.cardarea == G.play and card.ability.extra.seltzer > 0 then
            return {
                repetitions = card.ability.extra.seltzer
            }
        elseif context.first_hand_drawn == true and context.main_eval and card.ability.extra.turtle > 0 and not context.blueprint then
            G.hand:change_size(card.ability.extra.h_size+card.ability.extra.turtle)
        elseif context.setting_blind and card.ability.extra.teeth > 0 then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.teeth
            ease_discard(card.ability.extra.teeth)
        elseif card.ability.extra.extrachips > 0 and context.discard and context.other_card == context.full_hand[#context.full_hand] then
            for _, discarded_card in ipairs(context.full_hand) do
                discarded_card.ability.perma_bonus = discarded_card.ability.perma_bonus or 0
                discarded_card.ability.perma_bonus = discarded_card.ability.perma_bonus + card.ability.extra.extrachips
            end
        elseif card.ability.extra.extramult > 0 and context.before and context.main_eval and not context.blueprint then
            for _, scored_card in ipairs(context.scoring_hand) do
                scored_card.ability.perma_mult = scored_card.ability.perma_mult or 0
                scored_card.ability.perma_mult = scored_card.ability.perma_mult + card.ability.extra.extramult
            end
        end
    end
}

balf.obblongaleStorage = balf.obblongaleStorage or 0

SMODS.Joker {
    key = "obblongale",
    atlas = 'Jokers',
    pos = { x = 14, y = 0 },
    rarity = 3,
    blueprint_compat = false,
    cost = 8,
    config = { extra = { xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint and #G.jokers.cards > 1 then
            local my_pos
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            local num = math.random(1, #G.jokers.cards)
            while (num == my_pos) do
                num = math.random(1, #G.jokers.cards)
            end
            balf.obblongaleStorage = G.jokers.cards[num]
            local messageObblongale = "".. balf.obblongaleStorage.label .." Is the impostor"
            return {
                message = messageObblongale,
                colour = G.C.MULT,
                remove = true
            }
        end
        if not context.blueprint and context.balf and context.balf.joker_sold then
            if balf.lastSold == balf.obblongaleStorage then
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        add_tag(Tag('tag_ethereal'))
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        return true
                    end)
                }))
            end
        end
    end
}
-- comically small joker lmao

SMODS.Joker {
    key = "zero",
    atlas = 'Jokers',
    pos = { x = 2, y = 0 },
    rarity = 3,
    blueprint_compat = false,
    cost = 10,
    config = { extra = { colour_string = "FF6A00", background_colour = "351500" } },
    no_pool_flag = 'zero_sold',
    loc_vars = function(self, info_queue, card)
        return { vars = {  colours = { HEX(card.ability.extra.colour_string), HEX(card.ability.extra.background_colour),} } }
    end,
    calculate = function(self, card, context)
        if context.selling_self and not context.blueprint then
            local crashprotection = G.GAME.round_resets.ante
            ease_ante(-crashprotection)
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - crashprotection
            G.GAME.pool_flags.zero_sold = true
            return {
                    message = localize('k_extinct_ex')
                }
        end
        in_pool = function(self, args)
            return G.GAME.pool_flags.zero_sold
        end
    end
}

-- i like this one, no other comment.


SMODS.Joker {
    key = "melon",
    atlas = 'Jokers',
    pos = { x = 3, y = 0 },
    rarity = 3,
    blueprint_compat = false,
    cost = 9,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        my_pos = i
                        break
                    end
                end
            if my_pos and G.jokers.cards[my_pos + 1] ~= nil and G.jokers.cards[my_pos + 1].edition ~= nil then
                if my_pos and G.jokers.cards[my_pos + 1].edition.type == 'negative' then
                    G.jokers.cards[my_pos + 1].edition = nil
                    G.jokers.cards[my_pos + 1].ability.card_limit = 0
                    return {
				        message = localize('k_melon'),
				        colour = G.C.DARK_EDITION,
			        }
                end
            end
        end
    end
}

-- i made negatives USEFUL thank me later, balatralings


SMODS.Joker {
    key = "hackb",
    atlas = 'Jokers',
    pos = { x = 3, y = 3 },
    rarity = 3,
    blueprint_compat = false,
    cost = 11,
    config = { extra = { squared = 2 } },
    loc_vars = function(self, info_queue, card)
    return { vars = {card.ability.extra.squared} }
    end,
    add_to_deck = function(self, card, from_debuff)
		SMODS.set_scoring_calculation('add')
	end,
    remove_from_deck = function(self, card, from_debuff)
		SMODS.set_scoring_calculation('multiply')
	end,
    calculate = function(self, card, context)
        if context.final_scoring_step and not context.blueprint then
            SMODS.set_scoring_calculation('add')
            return {
				message = localize({
					type = "variable",
					key = "k_powmult",
					vars = {
						number_format(card.ability.extra.squared),
					},
				}),
				Emult_mod = card.ability.extra.squared,
				colour = G.C.DARK_EDITION,
                message = localize({
                    type = "variable",
                    key = "k_powchips",
                    vars = {
                        number_format(card.ability.extra.squared),
                    },
                }),
                Echip_mod = card.ability.extra.squared,
                colour = G.C.DARK_EDITION,
			}
        elseif context.setting_blind and not context.blueprint then
            if to_big(G.GAME.dollars) > to_big(3) then
                SMODS.set_scoring_calculation('add')
                ease_dollars(-(G.GAME.dollars/4))
            else
                return {
				    message = localize('k_hackb_d'),
				    colour = G.C.INACTIVE,
                    card:start_dissolve(),
			    }
            end
        end
    end
}

SMODS.Joker {
    key = "ems",
    atlas = 'Jokers',
    pos = { x = 2, y = 1 },
    rarity = 3,
    blueprint_compat = true,
    cost = 10,
    config = { extra = { xmult = 2 } },
    loc_vars = function(self, info_queue, card)
    return { vars = { colours = {HEX("7A5FCE")} }, card.ability.extra.xmult }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos and G.jokers.cards[my_pos + 1] and not G.jokers.cards[my_pos + 1].getting_sliced then
                G.jokers.cards[my_pos + 1]:add_sticker("balf_touched", true)
                return {
				        message = localize('k_ems'),
				        colour = G.C.PURPLE,
			        }
            end
        end
    end
}

SMODS.Joker {
    key = "sightseer",
    atlas = 'Jokers',
    pos = { x = 2, y = 4 },
    rarity = 3,
    blueprint_compat = false,
    cost = 9,
    calculate = function(self, card, context)
        if context.end_of_round and G.GAME.blind.boss and context.game_over == false and not context.blueprint then
            local modjokers = {}
            for k, v in pairs(G.P_CENTER_POOLS.Joker) do
                if v.mod and v.mod.id == "Balafreaks" and v.rarity == 4 then
                    table.insert(modjokers, v)
                end
            end
            local joker = pseudorandom_element(modjokers, pseudoseed('randomseed'))
            card:start_dissolve()
            SMODS.add_card({key = joker.key})
        end
    end
}

SMODS.Joker {
    key = "scary",
    atlas = 'Jokers',
    pos = { x = 0, y = 6 },
    rarity = 3,
    blueprint_compat = false,
    cost = 10,
    pixel_size = { h = 54, w = 39 },
    config = { extra = { odds = 2, mult = 6 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false then
            if pseudorandom('balf_scary') < G.GAME.probabilities.normal / card.ability.extra.odds then
                for i, v in ipairs(G.playing_cards) do
                    v.ability.perma_mult = v.ability.perma_mult or 0
                    v.ability.perma_mult = v.ability.perma_mult + card.ability.extra.mult
                end
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT },
                    card = card
                }
            else
                for i, v in ipairs(G.playing_cards) do
                    v.ability.perma_mult = v.ability.perma_mult or 0
                    v.ability.perma_mult = v.ability.perma_mult - card.ability.extra.mult
                end
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT },
                    card = card
                }
            end
        end
    end
}

-- LEGENDARY

-- if possible i'll make this check for the sticker that this gives and give -x2 mult per instance of it to nullify it's effect
-- DID IT

SMODS.Joker {
    key = "goblin",
    atlas = 'Jokers',
    pos = { x = 0, y = 2 },
    soul_pos = { x = 0, y = 3 },
    rarity = 4,
    blueprint_compat = true,
    cost = 25,
    config = { extra = { xmult = 0, ogmult = 0 } },
    loc_vars = function(self, info_queue, card)
    return { vars = {card.ability.extra.xmult, card.ability.extra.ogmult} }
    end,
    calculate = function(self, card, context)
        if context.final_scoring_step then
            card.ability.extra.xmult = card.ability.extra.xmult+((G.GAME.dollars)*3)
            ease_dollars(0-G.GAME.dollars)
            return { Xmult_mod = card.ability.extra.xmult,
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } } }
        elseif context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if G.GAME.blind.boss and to_big(card.ability.extra.xmult) > to_big(card.ability.extra.ogmult) then
                card.ability.extra.xmult = to_big(card.ability.extra.ogmult)
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
            end
        end
    end
}

SMODS.Joker {
    key = "matt",
    atlas = 'Jokers',
    pos = { x = 1, y = 2 },
    soul_pos = { x = 1, y = 3 },
    rarity = 4,
    blueprint_compat = true,
    cost = 25,
    config = { extra = { emult = 1, emult_gain = 0.15, parry = 1 } },
    loc_vars = function(self, info_queue, card)
    return { vars = {card.ability.extra.emult, card.ability.extra.emult_gain, card.ability.extra.parry} }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and G.GAME.blind.boss and context.game_over == false and context.main_eval and not context.blueprint then
            G.GAME.round_resets.ante = G.GAME.round_resets.ante+card.ability.extra.parry
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + card.ability.extra.parry
            card.ability.extra.emult = card.ability.extra.emult+card.ability.extra.emult_gain
        elseif context.joker_main then
            return {
				message = localize({
					type = "variable",
					key = "k_powmult",
					vars = {
						number_format(card.ability.extra.emult),
					},
				}),
				Emult_mod = card.ability.extra.emult,
				colour = G.C.DARK_EDITION,
			}
        end
    end
}

SMODS.Joker {
    key = "kade",
    atlas = 'Jokers',
    pos = { x = 2, y = 2 },
    soul_pos = { x = 2, y = 3 },
    rarity = 4,
    blueprint_compat = true,
    cost = 25,
    config = { extra = { retriggers = 1 } },
    loc_vars = function(self, info_queue, center)
		return { vars = { math.min(25, center.ability.extra.retriggers) } }
	end,
    calculate = function(self, card, context)
        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card.config.center_key ~= "j_balf_kade" then
			return {
				    message = localize("k_again_ex"),
				    repetitions = (card.ability.extra.retriggers),
				    card = card,
			    }
        end
    end
}

TimerGuwbi = {}
TimerGuwbi.seconds = TimerGuwbi.seconds or 0
TimerGuwbi.fill = TimerGuwbi.fill or 0
TimerGuwbi.mins = TimerGuwbi.mins or 0

SMODS.Joker {
    key = "guwbi",
    atlas = 'Jokers',
    pos = { x = 0, y = 4 },
    soul_pos = { x = 1, y = 4 },
    rarity = 4,
    blueprint_compat = true,
    cost = 25,
    config = { extra = { timer = 0, start = 0, minutes = 0, filler = ":", echips = 1, isbroken = false } },
    loc_vars = function(self, info_queue, card)
        main_end = {
            { n = G.UIT.O, config = { object = DynaText({ string = { {ref_table = TimerGuwbi, ref_value = "mins"} }, colours = { G.C.PURPLE }, 
            pop_in_rate = 9999999, silent = true, pop_delay = 0.5, scale = 0.64, min_cycle_time = 0,}) } },
            { n = G.UIT.O, config = { object = DynaText({ string = { {ref_table = TimerGuwbi, ref_value = "fill"} }, colours = { G.C.PURPLE },
            pop_in_rate = 9999999, silent = true, pop_delay = 0.5, scale = 0.64, min_cycle_time = 0,}) } },
            { n = G.UIT.O, config = { object = DynaText({ string = { {ref_table = TimerGuwbi, ref_value = "seconds"} }, colours = { G.C.PURPLE },
            pop_in_rate = 9999999, silent = true, pop_delay = 0.5, scale = 0.64, min_cycle_time = 0,}) } },
           }
        return { vars = { card.ability.extra.timer, card.ability.extra.minutes, card.ability.extra.filler, card.ability.extra.echips }, main_end = main_end }
    end,
    update = function(self, card, dt)
        if card.ability.extra.start == 0 and card.ability.extra.minutes ~= 3 then
            card.ability.extra.start = love.timer.getTime()
        end
        if card.ability.extra.minutes ~= 3 then
            local elapsed = love.timer.getTime() - card.ability.extra.start
            card.ability.extra.timer = (math.floor(elapsed/1))
        end
        if card.ability.extra.timer > 9 then
            card.ability.extra.filler = ":"
        else
            card.ability.extra.filler = ":0"
        end
        if card.ability.extra.timer == 60 and card.ability.extra.minutes ~= 3 then
            card.ability.extra.minutes = card.ability.extra.minutes+1
            card.ability.extra.timer = 0
            card.ability.extra.start = love.timer.getTime()
        end 
        if card.ability.extra.minutes == 3 then
            card.ability.extra.isbroken = true
        end
        if card.ability.extra.minutes < 0 then
            card.ability.extra.minutes = 0
            card.ability.extra.start = love.timer.getTime()
            card.ability.extra.timer = 0
        end
        if card.ability.extra.timer < 0 then
            card.ability.extra.timer = 0
            card.ability.extra.start = love.timer.getTime()
        end
        TimerGuwbi.seconds = tostring(card.ability.extra.timer)
        TimerGuwbi.mins = tostring(card.ability.extra.minutes)
        TimerGuwbi.fill = card.ability.extra.filler
    end,
    calculate = function(self, card, context)
        if card.ability.extra.isbroken == false then
            if context.end_of_round and G.GAME.blind.boss and context.game_over == false and context.main_eval then
                card.ability.extra.echips = card.ability.extra.echips +0.25
                card.ability.extra.minutes = card.ability.extra.minutes -1
            end
        end
        if context.joker_main then
            return {
                message = localize({
                    type = "variable",
                    key = "k_powchips",
                    vars = {
                        number_format(card.ability.extra.echips),
                    },
                }),
                Echip_mod = card.ability.extra.echips,
                colour = G.C.DARK_EDITION,
            }
        end
    end
}

SMODS.Joker {
    key = "unclear",
    atlas = 'Jokers',
    pos = { x = 4, y = 1 },
    soul_pos = { x = 4, y = 2 },
    rarity = 4,
    blueprint_compat = true,
    cost = 25,
    config = { extra = { xchips = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xchips } }
    end,
    calculate = function(self, card, context)
        if context.selling_self then
            SMODS.add_card {
                set = 'Joker',
                rarity = 'balf_unclearvar',
                            }
        elseif context.joker_main then
            card.ability.extra.xchips = card.ability.extra.xchips+1
            return { 
                xchips = card.ability.extra.xchips 
            }
        end
    end
}

SMODS.Joker {
    key = "runclear",
    atlas = 'Jokers',
    pos = { x = 5, y = 1 },
    soul_pos = { x = 5, y = 2 },
    rarity = "balf_unclearvar",
    blueprint_compat = true,
    cost = 1,
    config = { extra = { xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.selling_card and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + 2
            return {
                message = localize('k_upgrade_ex')
            }
        elseif context.joker_main then
            return {
                Xmult_mod = card.ability.extra.xmult,
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
            }
        end
    end
}

SMODS.Joker {
    key = "gunclear",
    atlas = 'Jokers',
    pos = { x = 6, y = 1 },
    soul_pos = { x = 6, y = 2 },
    rarity = "balf_unclearvar",
    blueprint_compat = true,
    cost = 1,
    config = {},
    loc_vars = function(self, info_queue, card)
        return { vars = { xmult = 1 } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            SMODS.add_card {
                set = 'Joker',
                rarity = 'Legendary',
                edition = 'e_negative',
            }
            return {
                card:start_dissolve(),
			}
        end
    end
}

SMODS.Joker {
    key = "punclear",
    atlas = 'Jokers',
    pos = { x = 7, y = 1 },
    soul_pos = { x = 7, y = 2 },
    rarity = "balf_unclearvar",
    blueprint_compat = true,
    cost = 1,
    config = {},
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            SMODS.add_card {
                set = 'Tarot',
                edition = 'e_negative',
            }
        end
    end
}

SMODS.Joker {
    key = "motherunclear",
    atlas = 'Jokers',
    pos = { x = 4, y = 3 },
    soul_pos = { x = 4, y = 4 },
    rarity = "balf_unclearvar",
    blueprint_compat = true,
    cost = 1,
    config = { extra = { colour_string = "510005" } },
    loc_vars = function(self, info_queue, card)
        return { vars = { colours = { HEX(card.ability.extra.colour_string) } } }
    end,
    calculate = function(self, card, context)
        if context.selling_self then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos and G.jokers.cards[my_pos + 1] ~= nil then
                G.jokers.cards[my_pos + 1]:set_edition('e_balf_mother', true)
            end
            if my_pos and G.jokers.cards[my_pos - 1] ~= nil then
                G.jokers.cards[my_pos - 1]:set_edition('e_balf_mother', true)
            end
        end
    end
}

SMODS.Joker {
    key = "wunclear",
    atlas = 'Jokers',
    pos = { x = 5, y = 3 },
    soul_pos = { x = 5, y = 4 },
    rarity = "balf_unclearvar",
    blueprint_compat = true,
    cost = 1,
    config = { extra = { retry = true } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.retry } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            if G.playing_card then
                while card.ability.extra.retry == true do
                    for _, playing_card in ipairs(G.playing_cards) do
                        if playing_card:is_face() then 
                            G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                            playing_card:remove()
                        end
                    end
                    card.ability.extra.retry = false
                    for _, playing_card in ipairs(G.playing_cards) do
                        if playing_card:is_face() then 
                            card.ability.extra.retry = true
                        end
                    end
                end
            end
            return { card:start_dissolve(), }
        end
    end
}

SMODS.Joker {
    key = "bunclear",
    atlas = 'Jokers',
    pos = { x = 6, y = 3 },
    soul_pos = { x = 6, y = 4 },
    rarity = "balf_unclearvar",
    blueprint_compat = true,
    cost = 1,
    config = {},
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            card:start_dissolve()
            local crashprotection = 0
            for i = 1, #G.jokers.cards do
                crashprotection = crashprotection +1
                if G.jokers.cards[i].config.center_key ~= 'j_balf_bunclear' or nil then
                    local copied_card = copy_card(G.jokers.cards[i])
                    local copied_card2 = copy_card(G.jokers.cards[i])
                    copied_card:add_to_deck()
                    G.jokers:emplace(copied_card)
                    copied_card2:add_to_deck()
                    G.jokers:emplace(copied_card2)
                end
                if crashprotection >= G.jokers.config.card_limit then
                    break
                end
            end
            G.jokers.config.card_limit = 0
            change_shop_size(-2)
        end
    end
}

SMODS.Joker {
    key = "mother3",
    atlas = 'Jokers',
    pos = { x = 6, y = 0 },
    soul_pos = { x = 7, y = 0 },
    rarity = 4,
    blueprint_compat = false,
    cost = 30,
    config = { extra = { colour_string = "510005" } },
    loc_vars = function(self, info_queue, card)
        return { vars = { colours = { HEX(card.ability.extra.colour_string) } } }
    end,
    calculate = function(self, card, context)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        if context.setting_blind and G.jokers.cards[my_pos + 1] ~= nil and G.jokers.cards[my_pos - 1] ~= nil and G.jokers.cards[my_pos + 1].edition ~= "e_balf_mother" and not context.blueprint then
            G.jokers.cards[my_pos - 1]:start_dissolve()
            G.jokers.cards[my_pos + 1]:set_edition('e_balf_mother', true)
        end
    end
}

if math.random(1, 66) == 66 then
    SMODS.Joker {
        key = "gaster",
        atlas = 'Jokers',
        pos = { x = 6, y = 6 },
        rarity = 3,
        blueprint_compat = true,
        cost = 6,
        config = { extra = { hands = 6, hands_remaining = 6, mult = 6, mult_gain = 6, stored = 0 } },
        loc_vars = function(self, info_queue, card)
            return { vars = { card.ability.extra.mult, card.ability.extra.hands, card.ability.extra.mult_gain, card.ability.extra.hands_remaining } }
        end,
        calculate = function(self, card, context)
            local played = 0
            if context.before and context.main_eval and not context.blueprint then
                for _, scored_card in ipairs(context.scoring_hand) do
                    played = played+1
                end
                card.ability.extra.hands_remaining = card.ability.extra.hands_remaining-played
                if 0 > card.ability.extra.hands_remaining then
                    card.ability.extra.stored = card.ability.extra.hands_remaining
                    card.ability.extra.hands_remaining = 0
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                    card.ability.extra.hands_remaining = card.ability.extra.hands
                end
                while card.ability.extra.stored < 0 do
                    if card.ability.extra.hands_remaining == 0 then
                        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                        card.ability.extra.hands_remaining = card.ability.extra.hands
                    end
                    if card.ability.extra.hands_remaining > card.ability.extra.stored then
                        card.ability.extra.hands_remaining = card.ability.extra.hands_remaining + card.ability.extra.stored
                        card.ability.extra.stored = 0
                    else
                        card.ability.extra.stored = card.ability.extra.stored + card.ability.extra.hands
                        if card.ability.extra.stored > 0 then
                            card.ability.extra.stored = 0
                        end
                        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                        card.ability.extra.hands_remaining = card.ability.extra.hands
                    end
                end
            end
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    }
end

function SMODS.current_mod.reset_game_globals(run_start)
    reset_balf_spam_rank()    -- [BIG SHOT] right here
end