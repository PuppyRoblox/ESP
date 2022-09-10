local CoreUI = game:GetService("CoreGui")
local Folder = Instance.new("Folder", CoreUI)
Folder.Name = "Clean Highlight"

local Content = {}

local module = {}

function module:AddESP(instance, color)

    local h = Instance.new("Highlight", Folder)
    h.Adornee = instance
    h.FillTransparency = 1
    h.OutlineColor = color

    if not Content[instance.Name] then
        Content[instance.Name] = h
    else
        h:Destroy()
    end

    return true

end

function module:RemoveESP(name)

    Content[name] = nil

    return true

end

function module:UpdateColor(name, color)
    if Content[name] then
        Content[name].OutlineColor = color
    else
        warn("Unable to find Highlight!")
        return false
    end
    return true
end

function module:DestroyAllESP()
    for _,v in pairs(Content) do
        v:Destroy()
    end
    return true
end

return module
