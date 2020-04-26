local _, VCLP = ...

local function addLine(tooltip, id)
  local best_in_slot = VCLP.SearchBiS(id)
  local offspec = VCLP.SearchOS(id)
  local priority = VCLP.SearchPrio(id)

  if best_in_slot or offspec or priority then
    local header = string.format("VC Loot Priority")
    tooltip:AddLine(header)
  end

  if best_in_slot then
    local bis = string.format("|c0000ff00  BiS: %s", best_in_slot)
    tooltip:AddLine(bis)
  end

  if offspec then
    local os = string.format("|c00ff8000  OS: %s", offspec)
    tooltip:AddLine(os)
  end

  if priority then
    local prio = string.format("|c0000b3b3  Prio: %s", priority)
    tooltip:AddLine(prio)
  end

  tooltip:Show()
end

local function AttachPrioTooltip(self)
  local link = select(2, self:GetItem())
  if not link then return end

  local itemId = string.match(link, "item:(%d+):")
  if not itemId then return end

  addLine(self, itemId)
end

GameTooltip:HookScript("OnTooltipSetItem", AttachPrioTooltip)
ItemRefTooltip:HookScript("OnTooltipSetItem", AttachPrioTooltip)
