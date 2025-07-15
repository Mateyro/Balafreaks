-- Bonus

SMODS.Enhancement {
    key = 'frozen',
    atlas = 'Enhancements',
    pos = { x = 0, y = 0 },
    config = { x_mult = 3 },
    shatters = true,
    weight = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.x_mult } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.destroy_card == card then
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