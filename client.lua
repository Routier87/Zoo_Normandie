CreateThread(function()
    for _, animal in pairs(Config.Animals) do
        local model = GetHashKey(animal.model)
        RequestModel(model)

        while not HasModelLoaded(model) do
            Wait(10)
        end

        local ped = CreatePed(
            28,
            model,
            animal.coords.x,
            animal.coords.y,
            animal.coords.z,
            animal.heading,
            false,
            true
        )

        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        TaskWanderInArea(
            ped,
            animal.coords.x,
            animal.coords.y,
            animal.coords.z,
            30.0,
            2.0,
            10.0
        )
    end
end)
