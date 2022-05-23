local QBCore = exports['qb-core']:GetCoreObject()
Update = {}

--- get random pet name
---@param type 'species'
---@param gender integer
function NameGenerator(type, gender)
    local names = {
        dog = { { "Max", "Buddy", "Charlie", "Jack", "Cooper", "Rocky", "Toby", "Tucker", "Jake", "Bear", "Duke", "Teddy",
            "Oliver", "Riley", "Bailey", "Bentley", "Milo", "Buster", "Cody", "Dexter", "Winston", "Murphy", "Leo",
            "Lucky", "Oscar", "Louie", "Zeus", "Henry", "Sam", "Harley", "Baxter", "Gus", "Sammy", "Jackson",
            "Bruno", "Diesel", "Jax", "Gizmo", "Bandit", "Rusty", "Marley", "Jasper", "Brody", "Roscoe", "Hank",
            "Otis", "Bo", "Joey", "Beau", "Ollie", "Tank", "Shadow", "Peanut", "Hunter", "Scout", "Blue", "Rocco",
            "Simba", "Tyson", "Ziggy", "Boomer", "Romeo", "Apollo", "Ace", "Luke", "Rex", "Finn", "Chance", "Rudy",
            "Loki", "Moose", "George", "Samson", "Coco", "Benny", "Thor", "Rufus", "Prince", "Chester", "Brutus",
            "Scooter", "Chico", "Spike", "Gunner", "Sparky", "Mickey", "Kobe", "Chase", "Oreo", "Frankie", "Mac",
            "Benji", "Bubba", "Champ", "Brady", "Elvis", "Copper", "Cash", "Archie", "Walter" },
        { "Bella", "Lucy", "Daisy", "Molly", "Lola", "Sophie", "Sadie", "Maggie", "Chloe", "Bailey", "Roxy",
            "Zoey", "Lily", "Luna", "Coco", "Stella", "Gracie", "Abby", "Penny", "Zoe", "Ginger", "Ruby", "Rosie",
            "Lilly", "Ellie", "Mia", "Sasha", "Lulu", "Pepper", "Nala", "Lexi", "Lady", "Emma", "Riley", "Dixie",
            "Annie", "Maddie", "Piper", "Princess", "Izzy", "Maya", "Olive", "Cookie", "Roxie", "Angel", "Belle",
            "Layla", "Missy", "Cali", "Honey", "Millie", "Harley", "Marley", "Holly", "Kona", "Shelby", "Jasmine",
            "Ella", "Charlie", "Minnie", "Willow", "Phoebe", "Callie", "Scout", "Katie", "Dakota", "Sugar", "Sandy",
            "Josie", "Macy", "Trixie", "Winnie", "Peanut", "Mimi", "Hazel", "Mocha", "Cleo", "Hannah", "Athena",
            "Lacey", "Sassy", "Lucky", "Bonnie", "Allie", "Brandy", "Sydney", "Casey", "Gigi", "Baby", "Madison",
            "Heidi", "Sally", "Shadow", "Cocoa", "Pebbles", "Misty", "Nikki", "Lexie", "Grace", "Sierra" } }
    }
    local size = #names[type][gender]
    return names[type][gender][math.random(1, size)]
end

function initInfoHelper(Player, slot, data)
    if Player.PlayerData.items[slot] then
        Player.PlayerData.items[slot].info = data
    end
    Player.Functions.SetInventory(Player.PlayerData.items, true)
end

--- inital pet data after player bought pet
---@param source any
---@param item any
function initItem(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local random = math.random(1, 2)
    local gender = { true, false }
    local gen = gender[random]
    item.info.hash = tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) ..
        QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
    item.info.name = NameGenerator('dog', random)
    item.info.gender = gen
    item.info.age = 0
    item.info.food = 100
    -- owener data
    item.info.owner = Player.PlayerData.charinfo
    -- inital level and xp
    item.info.level = 0
    item.info.XP = 0
    -- inital variation
    local petVariation = ''
    local maxHealth = 200
    for k, v in pairs(Config.pets) do
        if v.name == item.name then
            petVariation = PetVariation:getRandomPedVariationsName(v.model, true)
            maxHealth = v.maxHealth
        end
    end
    item.info.variation = petVariation
    item.info.health = maxHealth
    initInfoHelper(Player, item.slot, item.info)
end

-- 1 --> 7 year old
CalorieCalData = {
    dog = {
        maximumCal = 2000,
        activity = {
            low = 1.6,
            high = 5.0
        },
        RER = function(lbs)
            return 70 * (lbs ^ (0.75))
        end
    },
    cat = {
        maximumCal = 1000,
        activity = {
            low = 1.2,
            high = 1.8
        },
        RER = function(lbs)
            return 40 * (lbs ^ (0.75))
        end
    }
}

function CalorieCalData:calRER(lbs, type)
    local res = 0
    res = math.floor(self[type]['RER'](lbs))
    return res
end

function CalorieCalData:convertWeightToLbs(weight)
    return (weight * 10) / 500
end

local function convert_xp_to_level(xp)
    -- hardcoded level 0
    if xp >= 0 and xp <= 75 then
        return 0
    end

    local maxExp = 0
    local minExp = 0

    for i = 1, 51, 1 do
        maxExp = math.floor(math.floor((i + 300) * (2 ^ (i / 7))) / 4)
        minExp = math.floor(math.floor(((i - 1) + 300) * (2 ^ ((i - 1) / 7))) / 4)
        if xp >= minExp and xp <= maxExp then
            return i
        end
    end
end

local function calculate_next_xp_value(level)
    local maxExp = math.floor(math.floor((level + 300) * (2 ^ (level / 7))) / 4)
    local minExp = math.floor(math.floor(((level - 1) + 300) * (2 ^ ((level - 1) / 7))) / 4)
    local dif = maxExp - minExp
    local pr = math.floor(maxExp / minExp)
    local multi = 1
    return math.floor(dif / (multi * (level + 1) * pr))
end

local function current_level_max_xp(level)
    return math.floor(math.floor((level + 300) * (2 ^ (level / 7))) / 4)
end

function Update:xp(source, current_pet_data)
    local level = convert_xp_to_level(math.floor(current_pet_data.info.XP))
    local pet_name = current_pet_data.info.name

    if level > Config.Balance.maximumLevel then
        -- pet reached maximumLevel
        return
    end

    if current_pet_data.info.XP == 0 then
        current_pet_data.info.XP = 75
    end

    current_pet_data.info.XP = current_pet_data.info.XP + calculate_next_xp_value(level)
    -- increase level when pet reached max exp of current level
    if current_pet_data.info.XP > current_level_max_xp(level) then
        current_pet_data.info.level = level + 1
        TriggerClientEvent('QBCore:Notify', source, pet_name .. " gain new level " .. current_pet_data.info.level)
    end
end

function Update:health(source, data, current_pet_data)
    local pet_name = current_pet_data.info.name
    local net_pet = NetworkGetEntityFromNetworkId(data.netId)
    if net_pet == 0 then
        return
    end

    local c_health = GetEntityHealth(net_pet)
    print(c_health)
    if current_pet_data.info.health == c_health then
        return
    end

    if c_health <= 100 then
        TriggerClientEvent('QBCore:Notify', source, pet_name .. " died!", 'error')
        c_health = 0
    end
    current_pet_data.info.health = c_health
    Pet:save_all_info(source, current_pet_data.info.hash) -- saving health should be outside loop to prevent some expolits
end

function Update:food(petData, process_type)
    if petData == nil or process_type == nil then return end
    -- if process_type == 'increase' then
    --     local weight = CalorieCalData:convertWeightToLbs(requestedItem.weight)
    --     local RER = CalorieCalData:calRER(weight, 'dog') -- maxCalories
    --     local overEat = 0

    --     overEat = Config.weightIncreaseByOverEat
    --     local currentEstimatedFoodValue = requestedItem.info.food + CalorieCalData:convertWeightToLbs(data.amount)
    --     if currentEstimatedFoodValue > RER then
    --         mData = {
    --             key = data.key,
    --             content = RER * (Config.foodOverEat / 100)
    --         }
    --         overEat = RER - (RER * (Config.foodOverEat / 100))
    --         if Player.PlayerData.items[item.slot] then
    --             Player.PlayerData.items[item.slot].weight = Player.PlayerData.items[item.slot].weight +
    --                 (overEat * (Config.weightIncreaseByOverEat / 100))
    --         end
    --         Player.Functions.SetInventory(Player.PlayerData.items, true)
    --     elseif currentEstimatedFoodValue < RER and currentEstimatedFoodValue >= 0 then
    --         mData = {
    --             key = data.key,
    --             content = requestedItem.info.food + (data.amount * (Config.foodOverEat / 100))
    --         }
    --     else
    --         mData = {
    --             key = data.key,
    --             content = 500
    --         }
    --     end
    --     TriggerClientEvent('QBCore:Notify', source, "Pet food value increased too: " .. mData.content)
    --     return
    -- end
    if petData.info.food == 0 then
        if petData.info.health == 0 or petData.info.health <= 100 then
            -- force kill pet
            petData.info.health = 0 -- rewrite it just in case value changed for some reason
            print('pet is dead or died')
            return
        end
        petData.info.health = petData.info.health - 0.2
        return
    end

    if petData.info.food > 0 then
        -- value reached zore or negetive value
        -- local weight = CalorieCalData:convertWeightToLbs(requestedItem.weight)
        -- local RER = CalorieCalData:calRER(weight, 'dog') -- maxCalories
        -- -- step calculation ==> (1min / timeIterval) * foodCycle
        -- local step = math.floor(RER / ((60 / Config.DataUpdateInterval) * Config.foodCycleEnd))

        petData.info.food = petData.info.food - 1

        -- make sure food value not negative
        if petData.info.food < 0 then
            petData.info.food = 0
        end
        return
    end
end

-- ============================
--           Cooldown
-- ============================

local usageCooldown = Config.Settings.itemUsageCooldown * 1000
PlayersCooldown = {
    players = {}
}

function PlayersCooldown:initCooldown(player)
    self.players[player] = usageCooldown
end

function PlayersCooldown:cleanOflinePlayers()
    local onlinePlayers = QBCore.Functions.GetPlayers()
    for ID, cooldown in pairs(self.players) do
        for key, id in pairs(onlinePlayers) do
            if ID == id then
                goto here
            end
        end
        self.players[ID] = nil
        ::here::
    end
end

function PlayersCooldown:updateCooldown(player)
    if self.players[player] > 0 then
        self.players[player] = self.players[player] - 1000
    end
    return 0
end

function PlayersCooldown:isOnCooldown(player)
    if self.players[player] == nil then
        PlayersCooldown:initCooldown(player)
        return 0
    elseif self.players[player] == 0 then
        PlayersCooldown:initCooldown(player)
        return 0
    elseif self.players[player] > 0 then
        return self.players[player]
    end
end

function PlayersCooldown:onlinePlayers()
    local count = 0
    for _ in pairs(self.players) do
        count = count + 1
    end
    return count
end
