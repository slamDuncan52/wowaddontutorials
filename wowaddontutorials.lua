local zone = nil 
local TimeSinceLastUpdate = 0

local function UpdateCoordinates(self, elapsed)
        if zone ~= GetRealZoneText() then
                zone = GetRealZoneText()
                SetMapToCurrentZone()
        end

        TimeSinceLastUpdate = TimeSinceLastUpdate + elapsed

          if TimeSinceLastUpdate > 0.5 then
                  TimeSinceLastUpdate = 0
                  local posX, posY = GetPlayerMapPosition("player");
                  local x = math.floor(posX * 10000)/100
                  local y = math.floor(posY * 10000)/100
                  wowaddontutorialsFontString:SetText("|c98FB98ff("..x..", "..y..")")
          end
  end

  function wowaddontutorials_OnLoad(self, event, ...)
          self:RegisterEvent("ADDON_LOADED")
  end

  function wowaddontutorials_OnEvent(self, event, ...)
          if event == "ADDON_LOADED" and ... == "wowaddontutorials" then
                  self:UnregisterEvent("ADDON_LOADED")
                  wowaddontutorials:SetSize(100,50)
                  wowaddontutorials:SetPoint("TOP", "Minimap", "BOTTOM", 5, -5)
                  wowaddontutorials:SetScript("OnUpdate", UpdateCoordinates)
                  local coordsFont = wowaddontutorials:CreateFontString("wowaddontutorialsFontString", "ARTWORK", "GameFontNormal")
                  coordsFont:SetPoint("CENTER", "wowaddontutorials", "CENTER", 0, 0)
                  coordsFont:Show()
                  wowaddontutorials:Show()
          end
  end
