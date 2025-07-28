-- Bonus

SMODS.Enhancement {
    key = 'frozen',
    atlas = 'Enhancements',
    pos = { x = 0, y = 0 },
    config = { x_mult = 4, odds = 1 },
    shatters = true,
    weight = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.x_mult, card.ability.odds, G.GAME.probabilities.normal or 1 } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.destroy_card == card and pseudorandom('balf_frozen') < G.GAME.probabilities.normal / card.ability.odds then
            return { remove = true }
        end
    end
}

SMODS.Enhancement {
    key = 'goop',
    atlas = 'Enhancements',
    pos = { x = 1, y = 0 },
    always_scores = true,
    hide_base = true,
    weight = 0,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.before then
            local get_suit
            local my_pos
            local get_rank
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i] == card then
                    my_pos = i
                    break
                end
            end
            if context.scoring_hand[my_pos - 1] ~= nil then
                get_rank = context.scoring_hand[my_pos - 1].base.value
                get_suit = context.scoring_hand[my_pos - 1].base.suit
                assert(SMODS.change_base(context.scoring_hand[my_pos], get_suit, get_rank)) 
            end
        end
    end
}

SMODS.Enhancement {
    key = 'scrap',
    atlas = 'Enhancements',
    pos = { x = 1, y = 1 },
    hide_base = true,
    no_suit = true,
    no_rank = true,
    overrides_base_rank = true,
    replace_base_card = true,
    weight = 0,
    in_pool = function(self)
        return false
    end,
    calculate = function(self, card, context)
        if context.end_of_round then
            card:start_dissolve()
        end
    end
}

SMODS.Seal {
    key = 'orb',
    atlas = 'Enhancements',
    pos = { x = 0, y = 1 },
    badge_colour = G.C.UI.TEXT_DARK,
    calculate = function(self, card, context)
        if context.modify_scoring_hand then
            if context.other_card:get_seal() == 'balf_orb' then
                return {
                    add_to_hand = true
                }
            end
        end
    end
}

-- didn't work, too lazy to fix, moving this to nokaru joker

-- SMODS.Seal {
--     key = 'orb',
--     atlas = 'Enhancements',
--     pos = { x = 0, y = 1 },
--     config = { extra = { nat = 'filler', ret = false } },
--     badge_colour = G.C.UI.TEXT_DARK,
--     calculate = function(self, card, context)
--         print("I'm young!")
--         if context.modify_scoring_hand then
--             print ("Does this work?")
--             if context.other_card:get_seal() == 'balf_orb' then
--                 add_to_hand = true
--                 print("I'm old!")
--                 for i = 1, #G.jokers.cards do
--                         if G.jokers.cards[i].config.center_key == 'j_balf_nokaru' then
--                             card.ability.seal.extra.ret = true
--                             break
--                         else if G.jokers.cards[i].config.center_key ~= 'j_balf_nokaru' then
--                                 card.ability.seal.extra.ret = false
--                             end
--                         end
--                     end
--                 print (card.ability.seal.extra.nat)
--                 print (card.ability.seal.extra.ret)
--                 if card.ability.seal.extra.nat == 'filler' and card.ability.seal.extra.ret == true then
--                     local math = math.random(1, 4)
--                     if math == 1 then
--                         card.ability.seal.extra.nat = 'red'
--                         else if math == 2 then
--                             card.ability.seal.extra.nat = 'blue'
--                             else if math == 3 then
--                                 card.ability.seal.extra.nat = 'gold'
--                                 else if math == 4 then
--                                     card.ability.seal.extra.nat = 'purple'
--                                 end
--                             end
--                         end
--                     end
--                 end
--                 if card.ability.seal.extra.ret == true then
--                     if card.ability.seal.extra.nat == 'red' then
--                         if context.repetition then
--                             return {
--                                 repetitions = 1,
--                             }
--                         end
--                     end
--                     if card.ability.seal.extra.nat == 'blue' then
--                         if context.end_of_round and context.cardarea == G.hand and context.other_card == card and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
--                             G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
--                             G.E_MANAGER:add_event(Event({
--                                 trigger = 'before',
--                                 delay = 0.0,
--                                 func = function()
--                                     if G.GAME.last_hand_played then
--                                         local _planet = nil
--                                         for k, v in pairs(G.P_CENTER_POOLS.Planet) do
--                                             if v.config.hand_type == G.GAME.last_hand_played then
--                                                 _planet = v.key
--                                             end
--                                         end
--                                         if _planet then
--                                             SMODS.add_card({ key = _planet })
--                                         end
--                                         G.GAME.consumeable_buffer = 0
--                                     end
--                                     return true
--                                 end
--                             }))
--                             return { message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet }
--                         end
--                     end
--                     if card.ability.seal.extra.nat == 'purple' then
--                         if context.discard and context.other_card == card and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
--                             G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
--                             G.E_MANAGER:add_event(Event({
--                                 trigger = 'before',
--                                 delay = 0.0,
--                                 func = function()
--                                     SMODS.add_card({ set = 'Tarot' })
--                                     G.GAME.consumeable_buffer = 0
--                                     return true
--                                 end
--                             }))
--                             return { message = localize('k_plus_tarot'), colour = G.C.PURPLE }
--                         end
--                     end
--                 end
--             end
--         end
--     end,
--     get_p_dollars = function(self, card)
--         if card.ability.seal.extra.ret == true and card.ability.seal.extra.nat == 'gold' then
--             return (3)
--         end
--     end,
-- }