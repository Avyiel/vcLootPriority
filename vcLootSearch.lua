local _, VCLP = ...

function SearchBiS(item_id)
  for index, value in next, VCLP.LootData do
    if value["loot_id"] == item_id and value["bis"] ~= "" then
      return value["bis"]
    end
  end

  return false
end

function SearchOS(item_id)
  for index, value in next, VCLP.LootData do
    if value["loot_id"] == item_id and value["os"] ~= "" then
      return value["os"]
    end
  end

  return false
end

function SearchPrio(item_id)
  for index, value in next, VCLP.LootData do
    if value["loot_id"] == item_id and value["prio"] ~= "" then
      return value["prio"]
    end
  end

  return false
end

VCLP.SearchBiS = SearchBiS
VCLP.SearchOS = SearchOS
VCLP.SearchPrio = SearchPrio
