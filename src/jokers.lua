--[[

1. This mod will use the default Joker atlas for convenience and to not redistribute Balatro assets.
It is recommended that you include your own atlas. Check the SMODS documentation or example mods for more info.

2. Unlike some vanilla Jokers that put values in card.ability, these will all use card.ability.extra as it's best practice for modded Jokers.

3. The objective is not to recreate vanilla code 1-to-1 but to highlight best practices. So while effects should be practically the same, there might be some small differences.

4. Only some of Balatro's specific quirks will be explained. It is recommended to brush up on basic programming logic and basic lua knowledge before starting, as well as reading the documentation on Jokers and calculate functions.

]] --

-- NEW JOKERS TO BE ADDED
-- CHRIS - +3 Mult per hand or discard left - Common
-- CHARLES - STONE CARDS WILL NOW GAIN +50 CHIPS WHEN PLAYED - Uncommon
-- My name Is - Gives x3 Mult if your in-game name contains Z, T, or C - Common
-- OBBLONGALE - Becomes "Angry" in boss blinds and returns all cards played to hand - Uncommon
-- Death's Touch - Generates a Death tarot card when blind is defeated on the first hand - Common
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
                SMODS.add_card {
                    set = 'Joker',
                    key = 'j_balf_joe2',
                }
                else if context.end_of_round and G.GAME.blind.boss and context.game_over == false and context.main_eval and not context.blueprint then
                    card.ability.extra.evo = card.ability.extra.evo+1
                    if card.ability.extra.evo > 2 then
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
    config = { extra = { xmult = 4 }, },
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
    key = "greg",
    atlas = 'Jokers',
    pos = { x = 3, y = 4 },
    rarity = 1,
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
    key = "richard",
    atlas = 'Jokers',
    pos = { x = 2, y = 6 },
    rarity = 1,
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

-- UNCOMMON


SMODS.Joker {
    key = "acecards",
    atlas = 'Jokers',
    pos = { x = 6, y = 5 },
    rarity = 2,
    blueprint_compat = true,
    cost = 5,
    config = { extra = { xmultbase = 1, xmult = 0.1 } },
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
        local ace_tally = 0
        if G.playing_card then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:get_id() == 14 then ace_tally = ace_tally +1 
                end
            end
        end
        if context.joker_main then
        return {
                Xmult_mod = card.ability.extra.xmultbase + (card.ability.extra.xmult * ace_tally),
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmultbase + (card.ability.extra.xmult * ace_tally) } }
            }
        end
    end
}

SMODS.Joker {
    key = "nokaru",
    atlas = 'Jokers',
    pos = { x = 7, y = 5 },
    rarity = 2,
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
                    if context.before and context.main_eval and not context.blueprint then 
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
            if context.scoring_name == 'Flush Five' then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                        SMODS.add_card {
                            set = 'Tarot',
                            key = 'c_fool',
                            edition = 'e_negative',
                        }
                        SMODS.add_card {
                            set = 'Tarot',
                            key = 'c_fool',
                            edition = 'e_negative',
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
            elseif #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
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
    key = "tanaka",
    atlas = 'Jokers',
    pos = { x = 1, y = 1 },
    rarity = 2,
    blueprint_compat = false,
    cost = 4,
    config = { extra = { mult = 0, xmult = 1, chips = 0, dollars = 0, h_size = 0 } },
    loc_vars = function(self, info_queue, card)            
    local multiplier = 0
    local xmultiplier = 0
    local chipL = 0
    local dollaridoo = 0
    local turtolbeaner = 0
        return { vars = { card.ability.extra.mult, card.ability.extra.xmult, card.ability.extra.chips, card.ability.extra.dollars, card.ability.extra.h_size, card.ability.extra.mult + multiplier, card.ability.extra.xmult + xmultiplier, card.ability.extra.chips + chipL, card.ability.extra.dollars + dollaridoo, card.ability.extra.h_size + turtolbeaner } }
    end,
    calculate = function(self, card, context)
        
        if context.joker_main then
            local multiplier = 0
            local xmultiplier = 0
            local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        my_pos = i
                        break
                    end
                end
            if my_pos and G.jokers.cards[my_pos + 1] and not G.jokers.cards[my_pos + 1].getting_sliced and not context.blueprint then
                if G.jokers.cards[my_pos + 1].label == 'Gros Michel' then
                    local multiplier = 30
                    return {
                        mult = card.ability.extra.mult + multiplier
                    }
                else if G.jokers.cards[my_pos + 1].label == 'Popcorn' then
                    local multiplier = 40
                    return {
                        mult = card.ability.extra.mult + multiplier
                    }
                else if G.jokers.cards[my_pos + 1].label == 'Cavendish' then
                    local xmultiplier = 4
                    return {
                        xmult = card.ability.extra.xmult + xmultiplier
                    }
                else if G.jokers.cards[my_pos + 1].label == 'Ramen' then
                    local xmultiplier = 3
                    return {
                        xmult = card.ability.extra.xmult + xmultiplier
                    }
                else if G.jokers.cards[my_pos + 1].label == 'Ice Cream' then
                    local chipL = 200
                    return {
                        chips = card.ability.extra.chips + chipL
                    }
                else if G.jokers.cards[my_pos + 1].label == 'Egg' then

                end
                end
                end
                end
                end
                end
            end
        else if context.selling_self then
            local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        my_pos = i
                        break
                    end
                end
            if my_pos and G.jokers.cards[my_pos + 1] and not G.jokers.cards[my_pos + 1].getting_sliced then
                if G.jokers.cards[my_pos + 1].label == 'Diet Cola' then
                    return {
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = (function()
                                        add_tag(Tag('tag_double'))
                                        add_tag(Tag('tag_double'))
                                        play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                                        return true
                                    end)
                                }))
                            end
                        }
                end
            end
        else if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        my_pos = i
                        break
                    end
                end
            if my_pos and G.jokers.cards[my_pos + 1] and not G.jokers.cards[my_pos + 1].getting_sliced then
                if G.jokers.cards[my_pos + 1].label == 'Egg' then
                    dollaridoo = 6
                    return {
                        dollars = card.ability.extra.dollars + dollaridoo,
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.dollar_buffer = 0
                                    return true
                                end
                            }))
                        end
                    }
                else if G.jokers.cards[my_pos + 1].label == 'Turtle Bean' then
                    turtolbeaner = 5
                    G.hand:change_size(card.ability.extra.h_size-turtolbeaner)
                end
                end
            end
        else if context.repetition and context.cardarea == G.play then
            local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        my_pos = i
                        break
                    end 
                end
            if my_pos and G.jokers.cards[my_pos + 1] and not G.jokers.cards[my_pos + 1].getting_sliced then
                if G.jokers.cards[my_pos + 1].label == 'Seltzer' then
                    return {
                        repetitions = 2
                    }
                end
            end
        else if context.first_hand_drawn == true and context.main_eval and not context.blueprint then
            local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        my_pos = i
                        break
                    end 
                end
            if my_pos and G.jokers.cards[my_pos + 1] and not G.jokers.cards[my_pos + 1].getting_sliced then
                if G.jokers.cards[my_pos + 1].label == 'Turtle Bean' then
                    turtolbeaner = 5
                    G.hand:change_size(card.ability.extra.h_size+turtolbeaner)
                end
            end
        end
        end
        end
        end
        end
    end
}

-- code above this is a sin, if i touch anything it breaks, so i may as well leave that mess be as it WORKS somehow.

SMODS.Joker {
    key = "sophie",
    atlas = 'Jokers',
    pos = { x = 3, y = 2 },
    rarity = 2,
    blueprint_compat = true,
    cost = 4,
    config = { extra = { mult = 8, suit = 'Spades' } },
    loc_vars = function(self, info_queue, card)
        local queen_tally = 0
        if G.playing_card then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:is_suit((card.ability.extra.suit)) and playing_card:get_id() == 12 then queen_tally = queen_tally + 1 end
            end
        end
        return { vars = { card.ability.extra.mult, card.ability.extra.mult * queen_tally, localize(card.ability.extra.suit, 'suits_singular') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local queen_tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:is_suit((card.ability.extra.suit)) and playing_card:get_id() == 12 then queen_tally = queen_tally + 1 end
            end
            return {
                mult = card.ability.extra.mult * queen_tally
            }
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
        G.GAME.extra_pack_size = (G.GAME.extra_pack_size or 0) + card.ability.extra.booster
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.extra_pack_size = (G.GAME.extra_pack_size or 0) - card.ability.extra.booster
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
            else
                card.ability.extra.buffer = 0
                card.ability.extra.mode = "Active!"
            end
        end
    end
}

-- RARE

SMODS.Joker {
    key = "frost",
    atlas = 'Jokers',
    pos = { x = 0, y = 1 },
    rarity = 3,
    blueprint_compat = false,
    cost = 9,
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
    config = { extra = { chips = 2 } },
    loc_vars = function(self, info_queue, card)
    return { vars = {card.ability.extra.chips} }
    end,
    calculate = function(self, card, context)
        if context.final_scoring_step and not context.blueprint then
            card.ability.extra.chips = ((hand_chips^2)+(mult^2))-hand_chips
            mult = 1
            return { chip_mod = card.ability.extra.chips,
                message = localize('k_hackb'),
                }
        elseif context.setting_blind and not context.blueprint then
            if to_big(G.GAME.dollars) > to_big(9) then
                return { dollars = -10 }
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
            card.ability.extra.xmult = card.ability.extra.xmult+((G.GAME.dollars)*2)
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
    config = { extra = { emult = 1, emult_gain = 0.5, parry = 1 } },
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
        TimerGuwbi.seconds = tostring(card.ability.extra.timer)
        TimerGuwbi.mins = tostring(card.ability.extra.minutes)
        TimerGuwbi.fill = card.ability.extra.filler
    end,
    calculate = function(self, card, context)
        if card.ability.extra.isbroken == false then
            if context.end_of_round and G.GAME.blind.boss and context.game_over == false and context.main_eval then
                card.ability.extra.echips = card.ability.extra.echips +0.25
                card.ability.extra.minutes = card.ability.extra.minutes -1
            elseif context.joker_main then
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
    key = "brokenunclear",
    atlas = 'Jokers',
    pos = { x = 7, y = 3 },
    soul_pos = { x = 7, y = 4 },
    rarity = "balf_unclearvar",
    blueprint_compat = true,
    cost = 1,
    config = {},
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    calculate = function(self, card, context)
        if context.selling_self then
            G.GAME.dollars = G.GAME.dollars -100
            SMODS.add_card {
                set = 'Joker',
                key = 'j_balf_brokenunclear',
            }
        elseif context.joker_main then
            G.GAME.dollars = G.GAME.dollars -1
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        card:set_eternal(true)
    end,
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
        if context.setting_blind and G.jokers.cards[my_pos + 1] ~= nil and G.jokers.cards[my_pos - 1] ~= nil and not context.blueprint then
            G.jokers.cards[my_pos - 1]:start_dissolve()
            G.jokers.cards[my_pos + 1]:set_edition('e_balf_mother', true)
        end
    end
}

-- JOKE

SMODS.Joker {
    key = "p_goblin",
    atlas = 'Jokers',
    pos = { x = 3, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    cost = -1,
    config = { extra = { mult = -1 } },
    loc_vars = function(self, info_queue, card)
    return { vars = {card.ability.extra.mult} }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            return { mult = card.ability.extra.mult,
                    message = localize('k_pregnant'),
                    colour = G.C.RED    
                    }
        end
    end
}
