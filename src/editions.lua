SMODS.Shader({ key = 'motherized', path = 'motherized.fs' })

SMODS.Edition {
    key = 'mother',
    shader = 'motherized',
    in_shop = false,
    apply_to_float = true,
    badge_colour = HEX("510005"),
    weight = 1,
    extra_cost = 7,
    config = { repetitions = 1, extra = { colour_string = "510005" } },
    sound = { sound = "holo1", per = 1.2 * 1.58, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { colours = { HEX(card.edition.extra.colour_string) }, card.edition.repetitions } }
    end,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    calculate = function(self, card, context)
        if context.retrigger_joker_check and context.other_card == card and not context.retrigger_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                repetitions = (card.edition.repetitions),
            }
        end
        if context.repetition and context.cardarea == G.play and context.other_card == card then
          return {
                repetitions = (card.edition.repetitions)
            }
        end
    end
}