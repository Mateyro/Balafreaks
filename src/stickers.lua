SMODS.Sticker{
    key = "touched",
    atlas = "Stickers",
    pos = {x = 0, y = 0},
    loc_txt={
        name="Touched",
		label="Touched",
        text = {
            "{X:mult,C:white}X1.15{} Mult if Ems",
            "isn't held",
            "in hand",
        }
    },
	default_compat = true,
	rate = 0,
	badge_colour = HEX("7A5FCE"),
	calculate = function(self,card,context)
        local ret
        if (context.joker_main and card.ability.set == "Joker") or (context.main_scoring and context.cardarea == G.play and (card.ability.set == 'Enhanced' or card.ability.set == 'Default') ) then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].config.center_key == 'j_balf_ems' then
                    ret = 1
                    break
                else if G.jokers.cards[i].config.center_key ~= 'j_balf_ems' then
                        ret = 1.15
                    end
                end
            end
            if ret >1 then
                return {
                    Xmult_mod = ret,
                    message = localize { type = 'variable', key = 'a_xmult', vars = { ret } }
                }
            end
		end
	end
}

-- thanks warp zone for this lmao