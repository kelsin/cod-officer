CoD = {};

function CoD:OnLoad()
   print("CoD Officer Mod Loaded");
end

function CoD:RepairOn()
   print("Promoting current raid members to Raider");

   local guild, _, _ = GetGuildInfo("player");

   for i=0, GetNumRaidMembers() do
      local name, _, _, _, _, _, _, _, _, _, _ = GetRaidRosterInfo(i);
      
      local guildName, guildRankName, _ = GetGuildInfo("raid" .. i);
         
      if guildRankName == "Member" and guildName == guild then
         GuildPromote(name);
      end
   end
end

function CoD:RepairOff()
   print("Demoting all Raiders");

   local guild, _, _ = GetGuildInfo("player");

   for i=0, GetNumRaidMembers() do
      local name, _, _, _, _, _, _, _, _, _, _ = GetRaidRosterInfo(i);
      
      local guildName, guildRankName, _ = GetGuildInfo("raid" .. i);
         
      if guildRankName == "Raider" and guildName == guild then
         GuildDemote(name);
      end
   end
end

function CoD:Handler(msg, editbox)
   local command, rest = msg:match("^(%S*)%s*(.-)$");

   if command == "repair" then
      if rest == "on" then
         CoD:RepairOn();
      elseif rest == "off" then
         CoD:RepairOff();
      else
	 print("Syntax: /cod repair on|off");
      end
   else
      print("Commands: repair");
   end
end

SLASH_COD1 = "/cod";
SlashCmdList["COD"] = function(msg, editbox) CoD:Handler(msg, editbox) end
