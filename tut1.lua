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
                  tut1FontString:SetText("|c98FB98ff("..x..", "..y..")")
          end
  end

  function tut1_OnLoad(self, event, ...)
          self:RegisterEvent("ADDON_LOADED")
  end

  function tut1_OnEvent(self, event, ...)
          if event == "ADDON_LOADED" and ... == "tut1" then
                  self:UnregisterEvent("ADDON_LOADED")
                  tut1:SetSize(100,50)
                  tut1:SetPoint("TOP", "Minimap", "BOTTOM", 5, -5)
                  tut1:SetScript("OnUpdate", UpdateCoordinates)
                  local coordsFont = tut1:CreateFontString("tut1FontString", "ARTWORK", "GameFontNormal")
                  coordsFont:SetPoint("CENTER", "tut1", "CENTER", 0, 0)
                  coordsFont:Show()
                  tut1:Show()
          end
  end
