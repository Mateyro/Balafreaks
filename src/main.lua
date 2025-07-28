SMODS.Atlas{
    key = 'Jokers',
    path = 'jokers.png',
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = 'Enhancements',
    path = 'enhancements.png',
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = 'Stickers',
    path = 'stickers.png',
    px = 71,
    py = 95
}

SMODS.Atlas({
    key = 'Blinds',
    path = 'blinds.png',
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    px = 34,
    py = 34
})

 -- i forgot why i put this here but i think its important
if not balf then
	balf = {}
end

balf.colours = {
	rainRed = HEX("FF0000"),
        rainOra = HEX("FF6A00"),
        rainYel = HEX("FFD800"),
        rainGre = HEX("00FF21"),
        rainCya = HEX("00FFFF"),
        rainBlu = HEX("0026FF"),
        rainPur = HEX("B200FF"),
        toucheded = HEX("7A5FCE"),
}

balf.colours.rainbow = SMODS.Gradient({
    key = 'rainbow',
    colours = {
        HEX("FF0000"),
        HEX("FF6A00"),
        HEX("FFD800"),
        HEX("00FF21"),
        HEX("00FFFF"),
        HEX("0026FF"),
        HEX("B200FF"),
    },
    cycle = 10,
    interpolation = 'trig',
    })


    -- all the localization logic blehhh thank you vanillaremade
function init_localization()
  G.localization.misc.v_dictionary_parsed = {}
  for k, v in pairs(G.localization.misc.v_dictionary) do
    if type(v) == 'table' then
      G.localization.misc.v_dictionary_parsed[k] = {multi_line = true}
      for kk, vv in ipairs(v) do
        G.localization.misc.v_dictionary_parsed[k][kk] = loc_parse_string(vv)
      end
    else
      G.localization.misc.v_dictionary_parsed[k] = loc_parse_string(v)
    end
  end
  G.localization.misc.v_text_parsed = {}
  for k, v in pairs(G.localization.misc.v_text) do
    G.localization.misc.v_text_parsed[k] = {}
    for kk, vv in ipairs(v) do
      G.localization.misc.v_text_parsed[k][kk] = loc_parse_string(vv)
    end
  end
  G.localization.tutorial_parsed = {}
  for k, v in pairs(G.localization.misc.tutorial) do
    G.localization.tutorial_parsed[k] = {multi_line = true}
      for kk, vv in ipairs(v) do
        G.localization.tutorial_parsed[k][kk] = loc_parse_string(vv)
      end
  end
  G.localization.quips_parsed = {}
  for k, v in pairs(G.localization.misc.quips or {}) do
    G.localization.quips_parsed[k] = {multi_line = true}
      for kk, vv in ipairs(v) do
        G.localization.quips_parsed[k][kk] = loc_parse_string(vv)
      end
  end
  for g_k, group in pairs(G.localization) do
    if g_k == 'descriptions' then
      for _, set in pairs(group) do
        for _, center in pairs(set) do
          center.text_parsed = {}
          if not center.text then else
          for _, line in ipairs(center.text) do
            center.text_parsed[#center.text_parsed+1] = loc_parse_string(line)
          end
          center.name_parsed = {}
          for _, line in ipairs(type(center.name) == 'table' and center.name or {center.name}) do
            center.name_parsed[#center.name_parsed+1] = loc_parse_string(line)
          end
          if center.unlock then
            center.unlock_parsed = {}
            for _, line in ipairs(center.unlock) do
              center.unlock_parsed[#center.unlock_parsed+1] = loc_parse_string(line)
            end
          end
        end
        end
      end
    end
  end
end

 -- sweet.
SMODS.current_mod.optional_features = {
	retrigger_joker = true,
  quantum_enhancements = true,
}

SMODS.Rarity({
	key = "unclearvar",
	loc_txt = {},
	badge_colour = balf.colours.rainbow,
})

SMODS.Sound{
    key = "mynameis",
    path = "mynameis.ogg",
}

balf.HackbOperator = {}
balf.HackbOperator.op = balf.HackbOperator.op or 0
balf.HackbOperator.symb = balf.HackbOperator.symb or "X"

function balf.getscore(hand_chips, mult)
  if balf.HackbOperator.op == 0 then 
    return to_big(hand_chips)*to_big(mult)
    else if balf.HackbOperator.op == 1 then 
      return to_big(hand_chips)+to_big(mult)
    end
  end
end

function fixoperator()
  local fix = G.HUD:get_UIE_by_ID('opUI')
  if fix then
    fix.config.text = balf.HackbOperator.symb
    fix.config.text_drawable:set(balf.HackbOperator.symb)
    fix.UIBox:recalculate()
  end
end

-- thanks Astronomica fo the inspiration

local lcpref = Controller.L_cursor_press
function Controller:L_cursor_press(x, y)
    lcpref(self, x, y)
    if G and G.jokers and G.jokers.cards and not G.SETTINGS.paused then
        SMODS.calculate_context({ balf_press = true })
    end
end
-- Thanks Cryptid for the code, unironically could've done this myself but i'm lazy rn :P