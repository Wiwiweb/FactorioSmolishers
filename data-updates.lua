-- From space-age's enemies.lua:

-- function make_demolisher(base_name, order, scale, damage_multiplier, health, regen, speed_multiplier, factoriopedia_simulation, sounds)
-- function make_demolisher_segment_specifications(base_name, demolisher_segment_scales, scale)
-- function make_demolisher_segments(base_name, segment_scales, scale, damage_multiplier, health, sounds)

-- make_demolisher("small-demolisher", "s-h", 0.5, 1, 30000, 40, 0.55, simulations.factoriopedia_vulcanus_enemy_small_demolisher, space_age_sounds.demolisher.small)
-- make_demolisher("medium-demolisher", "s-i", 0.75, 1.5, 100000, 130, 0.6, simulations.factoriopedia_vulcanus_enemy_medium_demolisher, space_age_sounds.demolisher.medium)
-- make_demolisher("big-demolisher", "s-j", 1.0, 2.5, 300000, 400, 0.65, simulations.factoriopedia_vulcanus_enemy_big_demolisher, space_age_sounds.demolisher.big)

local space_age_sounds = require("__space-age__.prototypes.entity.sounds")

local demolisher_stats = { -- Taken from space age
  ["small-demolisher"] = {
    scale = 0.5,
    damage_multiplier = 1,
    health = 30000,
    sounds = space_age_sounds.demolisher.small,
  },
  ["medium-demolisher"] = {
    scale = 0.75,
    damage_multiplier = .5,
    health = 100000,
    sounds = space_age_sounds.demolisher.medium,
  },
  ["big-demolisher"] = {
    scale = 1,
    damage_multiplier = 2.5,
    health = 300000,
    sounds = space_age_sounds.demolisher.big,
  },
}

local tail_scale = 1.09

for base_name, prototype in pairs(data.raw["segmented-unit"]) do
  local this_demolisher_stats = demolisher_stats[base_name] or demolisher_stats["small-demolisher"]
  data:extend(make_demolisher_segments(base_name, {tail_scale}, this_demolisher_stats.scale, this_demolisher_stats.damage_multiplier, this_demolisher_stats.health, this_demolisher_stats.sounds))
  prototype.segment_engine.segments = make_demolisher_segment_specifications(base_name, {tail_scale}, this_demolisher_stats.scale)
  prototype.enraged_speed = prototype.enraged_speed * 3
  prototype.acceleration_rate = prototype.acceleration_rate * 1000000
end
