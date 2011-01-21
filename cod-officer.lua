function CoD:RepairOn
   for i = 1, GetNumRaidMembers() do
      r_name, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil = GetRaidRosterInfo(i);
      if GetGuildInfo(r_name) == "Cake or Death" then
         for j = 1, GetNumGuildMembers() do
            g_name, g_rank, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil = GetGuildRosterInfo(j);
            if g_name == r_name and g_rank == "Member" then
               GuildPromote(g_name);
            end
         end
      end
   end
end

function CoD:RepairOff
   for j = 1, GetNumGuildMembers() do
      g_name, g_rank, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil = GetGuildRosterInfo(j);
      if (g_rank == "Raider") then
         GuildDemote(g_name);
      end
   end
end

-- Slash command
SLASH_COD1 = '/cod'

function SlashCmdList.COD(msg, editbox)
   local command, rest = msg:match("^(%S*)%s*(.-)$");

   if command == "repair" and rest == "on" then
      CoD:RepairOn()
   elseif command == "repair" and rest == "off" then
      CoD:RepairOff()
   end
end
