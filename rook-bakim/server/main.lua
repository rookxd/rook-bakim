bakim = false

local function isAdmin(source)
    local allowed = false
    for i, id in ipairs(Config.Admins) do
        for x, pid in ipairs(GetPlayerIdentifiers(source)) do
            if string.lower(pid) == string.lower(id) then
                allowed = true
            end
        end
    end
    return allowed
end


AddEventHandler('playerConnecting', function(name, setReason, deferrals)
    if (isAdmin(source)) then
        return
    end
    
    deferrals.defer()
    Wait(0)
    
    if bakim then
        deferrals.done('Sunucu şuan bakımda discorddan daha fazla bilgi alabilirsiniz ' .. Config.DiscordLink)
    else
        deferrals.done()
    end
end)

RegisterCommand('bakim', function(source)
    local src = source
    if src == 0 then
        if not bakim then
            bakim = true
            print('Bakim modu acildi')
        else
            bakim = false
            print('Bakim modu kapatildi')
        end
    end
end)
