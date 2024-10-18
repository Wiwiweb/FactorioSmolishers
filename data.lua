for _demolisher_name, demolisher_prototype in pairs(data.raw["segmented-unit"]) do
  local segments = demolisher_prototype.segment_engine.segments
  local new_segments = {segments[#segments]}
  demolisher_prototype.segment_engine.segments = new_segments
end
