to_big = to_big or function(x) return x end

-- 3
-- Debuffs JOKERS with editions
SMODS.Blind({
    key = 'mother',
    atlas = 'Blinds',
    pos = {x = 0, y = 0},
    dollars = 5,
    mult = 2,
    boss = {min = 3, max = 10},
    boss_colour = HEX('BF10BC'),
    recalc_debuff = function(self, card, from_blind)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].edition ~= nil then
                G.jokers.cards[i]:set_debuff(true)
            end 
        end
    end,
})

-- he's big and greedy
-- If score is >X2 blind requirement, set money to $0
SMODS.Blind({
    key = 'greedy',
    atlas = 'Blinds',
    pos = {x = 0, y = 1},
    dollars = 6,
    mult = 2,
    boss = {min = 2, max = 10},
    boss_colour = HEX('827929'),
    defeat = function(self)
        if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) * 2 then
            ease_dollars(0-G.GAME.dollars)
            G.GAME.blind:wiggle()
        end
    end,
})

-- head first or feet first
-- Destroys all consumables, X1.5 Blind Requirement per Consumable destroyed
SMODS.Blind({
    key = 'woodchipper',
    atlas = 'Blinds',
    pos = {x = 0, y = 2},
    dollars = 5,
    mult = 2,
    boss = {min = 1, max = 10},
    boss_colour = HEX('16B275'),
    set_blind = function(self)
        for i = 1, #G.consumeables.cards do
            G.consumeables.cards[i]:start_dissolve()
            G.GAME.blind.chips = G.GAME.blind.chips *1.5
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            G.GAME.blind:wiggle()
        end
    end,
})

-- COMPANY
-- Adds random "Scrap" to be held in hand at the start of round and after every Hand played
-- Scrap will be an enhancement that does nothing but negatively affect you, Scrap cards
-- will be destroyed after blind is completed
SMODS.Blind({
    key = 'lethal',
    atlas = 'Blinds',
    pos = {x = 0, y = 6},
    dollars = 5,
    mult = 2,
    boss = {min = 1, max = 10},
    boss_colour = HEX('B40A01'),
    drawn_to_hand = function(self)

        local copy_card = create_playing_card({ center = G.P_CENTERS.m_balf_scrap }, G.discard, true, false, nil, true)

        copy_card:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, copy_card)
            G.hand:emplace(copy_card)
            copy_card.states.visible = nil

            G.E_MANAGER:add_event(Event({
                func = function()
                    copy_card:start_materialize()
                    return true
                end
            }))
    end,
})

-- CRAFT
-- every other action taken (Discard or Hand played) turn all cards held in hand to Stone Cards
SMODS.Blind({
    key = 'miner',
    atlas = 'Blinds',
    pos = {x = 0, y = 3},
    dollars = 5,
    mult = 2,
    boss = {min = 1, max = 10},
    boss_colour = HEX('5C7738'),
    config = {extra = {other = -1}},
    drawn_to_hand = function(self)
        if self.config.extra.other == 0 then
            self.config.extra.other = self.config.extra.other+1
        else
            for i = 1, #G.hand.cards do
                G.hand.cards[i]:set_ability('m_stone', nil, true)
            end
            G.GAME.blind:wiggle()
            self.config.extra.other = 0
        end
    end,
})

-- maybe it was all a dream
-- adds -1 to the Ante count when beaten
SMODS.Blind({
    key = 'station',
    atlas = 'Blinds',
    pos = {x = 0, y = 4},
    dollars = 7,
    mult = 5,
    boss = {min = 1, max = 10},
    boss_colour = HEX('A03280'),
    config = {extra = {cap = 0.5}},
    loc_vars = function(self, info_queue, card)
    end,
    defeat = function(self)
        ease_ante(-1)
    end,
})

-- MADNESS
-- -1 Rank to all cards held in hand or played
SMODS.Blind({
    key = 'twirl',
    atlas = 'Blinds',
    pos = {x = 0, y = 5},
    dollars = 5,
    mult = 2,
    boss = {min = 1, max = 10},
    boss_colour = HEX('7F9D6D'),
    press_play = function(self)
        for i = 1, #G.hand.cards do
            local val = (G.hand.cards[i]:get_id())-1
            local suit = G.hand.cards[i].base.suit
            if val == 11 then
                val = "Jack"
            else if val == 12 then
                val = "Queen"
            else if val == 13 then
                val = "King"
            else if val == 1 then
                val = "Ace"
            end
            end
            end
            end
            local valfull = tostring(val)
            assert(SMODS.change_base(G.hand.cards[i], suit, valfull)) 
        end
        G.GAME.blind:wiggle()
    end,
})

--showdown

-- wait a second this isnt sans francisco
-- disables all cards, rely on your jokers alone, X1 score requirement
SMODS.Blind({
    key = 'disabled',
    atlas = 'Blinds',
    pos = {x = 0, y = 0},
    dollars = 5,
    mult = 1,
    boss = {min = 1, max = 10, showdown = true},
    boss_colour = HEX('AE718E'),
    config = {extra = {cap = 0.5}},
    loc_vars = function(self, info_queue, card)
    end,
    recalc_debuff = function(self, card, from_blind)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].edition ~= nil then
                G.jokers.cards[i]:set_debuff(true)
            end 
        end
    end,
})

-- LETHAAAAL
-- X4 base score requirement
-- 1 Hand
-- 0 Discards
-- Also generates Random Scrap
SMODS.Blind({
    key = 'eclipse',
    atlas = 'Blinds',
    pos = {x = 0, y = 0},
    dollars = 5,
    mult = 1,
    boss = {min = 1, max = 10, showdown = true},
    boss_colour = HEX('AE718E'),
    config = {extra = {cap = 0.5}},
    loc_vars = function(self, info_queue, card)
    end,
    recalc_debuff = function(self, card, from_blind)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].edition ~= nil then
                G.jokers.cards[i]:set_debuff(true)
            end 
        end
    end,
})

-- let me solo them
-- X5 Base Chips, X2 Base chips every hand the Blind isn't beat
SMODS.Blind({
    key = 'elevator',
    atlas = 'Blinds',
    pos = {x = 0, y = 0},
    dollars = 5,
    mult = 1,
    boss = {min = 1, max = 10, showdown = true},
    boss_colour = HEX('AE718E'),
    config = {extra = {cap = 0.5}},
    loc_vars = function(self, info_queue, card)
    end,
    recalc_debuff = function(self, card, from_blind)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].edition ~= nil then
                G.jokers.cards[i]:set_debuff(true)
            end 
        end
    end,
})