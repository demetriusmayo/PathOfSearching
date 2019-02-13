-- Path of Building
--
-- Module: Global
-- Global constants
--

colorCodes = {
    NORMAL = "^xC8C8C8",
    MAGIC = "^x8888FF",
    RARE = "^xFFFF77",
    UNIQUE = "^xAF6025",
    RELIC = "^x60C060",
    GEM = "^x1AA29B",
    PROPHECY = "^xB54BFF",
    CURRENCY = "^xAA9E82",
    CRAFTED = "^xB8DAF1",
    CUSTOM = "^x5CF0BB",
    SOURCE = "^x88FFFF",
    UNSUPPORTED = "^xF05050",
    WARNING = "^xFF9922",
    TIP = "^x80A080",
    FIRE = "^xD02020",
    COLD = "^x60A0E7",
    LIGHTNING = "^xFFD700",
    CHAOS = "^xD02090",
    POSITIVE = "^x33FF77",
    NEGATIVE = "^xDD0022",
    OFFENCE = "^xE07030",
    DEFENCE = "^x8080E0",
    SCION = "^xFFF0F0",
    MARAUDER = "^xE05030",
    RANGER = "^x70FF70",
    WITCH = "^x7070FF",
    DUELIST = "^xE0E070",
    TEMPLAR = "^xC040FF",
    SHADOW = "^x30C0D0",
    MAINHAND = "^x50FF50",
    MAINHANDBG = "^x071907",
    OFFHAND = "^xB7B7FF",
    OFFHANDBG = "^x070719",
    SHAPER = "^x55BBFF",
    ELDER = "^xAA77CC",
}
colorCodes.STRENGTH = colorCodes.MARAUDER
colorCodes.DEXTERITY = colorCodes.RANGER
colorCodes.INTELLIGENCE = colorCodes.WITCH

ModFlag = {}
-- Damage modes
ModFlag.Attack = 0x00000001
ModFlag.Spell = 0x00000002
ModFlag.Hit = 0x00000004
ModFlag.Dot = 0x00000008
ModFlag.Cast = 0x00000010
-- Damage sources
ModFlag.Melee = 0x00000100
ModFlag.Area = 0x00000200
ModFlag.Projectile = 0x00000400
ModFlag.SourceMask = 0x00000600
ModFlag.Ailment = 0x00000800
-- Weapon types
ModFlag.Axe = 0x00001000
ModFlag.Bow = 0x00002000
ModFlag.Claw = 0x00004000
ModFlag.Dagger = 0x00008000
ModFlag.Mace = 0x00010000
ModFlag.Staff = 0x00020000
ModFlag.Sword = 0x00040000
ModFlag.Wand = 0x00080000
ModFlag.Unarmed = 0x00100000
-- Weapon classes
ModFlag.WeaponMelee = 0x00200000
ModFlag.WeaponRanged = 0x00400000
ModFlag.Weapon = 0x00800000
ModFlag.Weapon1H = 0x01000000
ModFlag.Weapon2H = 0x02000000

KeywordFlag = {}
-- Skill keywords
KeywordFlag.Aura = 0x00000001
KeywordFlag.Curse = 0x00000002
KeywordFlag.Warcry = 0x00000004
KeywordFlag.Movement = 0x00000008
KeywordFlag.Fire = 0x00000010
KeywordFlag.Cold = 0x00000020
KeywordFlag.Lightning = 0x00000040
KeywordFlag.Chaos = 0x00000080
KeywordFlag.Vaal = 0x00000100
KeywordFlag.Bow = 0x00000200
-- Skill types
KeywordFlag.Trap = 0x00001000
KeywordFlag.Mine = 0x00002000
KeywordFlag.Totem = 0x00004000
KeywordFlag.Minion = 0x00008000
KeywordFlag.Attack = 0x00010000
KeywordFlag.Spell = 0x00020000
KeywordFlag.Hit = 0x00040000
KeywordFlag.Ailment = 0x00080000
-- Other effects
KeywordFlag.Poison = 0x00100000
KeywordFlag.Bleed = 0x00200000
KeywordFlag.Ignite = 0x00400000
-- Damage over Time types
KeywordFlag.PhysicalDot = 0x01000000
KeywordFlag.LightningDot = 0x02000000
KeywordFlag.ColdDot = 0x04000000
KeywordFlag.FireDot = 0x08000000
KeywordFlag.ChaosDot = 0x10000000

-- Active skill types, used in ActiveSkills.dat and GrantedEffects.dat
-- Had to reverse engineer this, not sure what all of the values mean
SkillType = {
    Attack = 1,
    Spell = 2,
    Projectile = 3, -- Specifically skills which fire projectiles
    DualWield = 4, -- Attack requires dual wielding, only used on Dual Strike
    Buff = 5,
    Removed6 = 6, -- Now removed, was CanDualWield: Attack can be used while dual wielding
    MainHandOnly = 7, -- Attack only uses the main hand; removed in 3.5 but still needed for 2.6
    Removed8 = 8, -- Now removed, was only used on Cleave
    Minion = 9,
    Hit = 10, -- Skill hits (not used on attacks because all of them hit)
    Area = 11,
    Duration = 12,
    Shield = 13, -- Skill requires a shield
    ProjectileDamage = 14, -- Skill deals projectile damage but doesn't fire projectiles
    ManaCostReserved = 15, -- The skill's mana cost is a reservation
    ManaCostPercent = 16, -- The skill's mana cost is a percentage
    SkillCanTrap = 17, -- Skill can be turned into a trap
    SpellCanTotem = 18, -- Spell can be turned into a totem
    SkillCanMine = 19, -- Skill can be turned into a mine
    CauseElementalStatus = 20, -- Causes elemental status effects, but doesn't hit (used on Herald of Ash to allow Elemental Proliferation to apply)
    CreateMinion = 21, -- Creates or summons minions
    AttackCanTotem = 22, -- Attack can be turned into a totem
    Chaining = 23,
    Melee = 24,
    MeleeSingleTarget = 25,
    SpellCanRepeat = 26, -- Spell can repeat via Spell Echo
    Type27 = 27, -- No idea, used on auras and certain damage skills
    AttackCanRepeat = 28, -- Attack can repeat via Multistrike
    CausesBurning = 29, -- Deals burning damage
    Totem = 30,
    Type31 = 31, -- No idea, used on Molten Shell and the Thunder glove enchants, and added by Blasphemy
    Curse = 32,
    FireSkill = 33,
    ColdSkill = 34,
    LightningSkill = 35,
    TriggerableSpell = 36,
    Trap = 37,
    MovementSkill = 38,
    Removed39 = 39, -- Now removed, was Cast
    DamageOverTime = 40,
    Mine = 41,
    TriggeredSpell = 42,
    Vaal = 43,
    Aura = 44,
    LightningSpell = 45, -- Used for Mjolner
    Type46 = 46, -- Doesn't appear to be used at all
    TriggeredAttack = 47,
    ProjectileAttack = 48,
    MinionSpell = 49, -- Used for Null's Inclination
    ChaosSkill = 50,
    Type51 = 51, -- Not used by any skill
    Type52 = 52, -- Allows Contagion, Blight and Scorching Ray to be supported by Iron Will
    Type53 = 53, -- Allows Burning Arrow and Vigilant Strike to be supported by Inc AoE and Conc Effect
    Type54 = 54, -- Not used by any skill
    Type55 = 55, -- Allows Burning Arrow to be supported by Inc/Less Duration and Rapid Decay
    Type56 = 56, -- Not used by any skill
    Type57 = 57, -- Appears to be the same as 47
    Channelled = 58,
    Type59 = 59, -- Allows Contagion, Blight and Scorching Ray to be supported by Controlled Destruction
    ColdSpell = 60, -- Used for Cospri's Malice
    TriggeredGrantedSkill = 61, -- Skill granted by item that is automatically triggered, prevents trigger gems and trap/mine/totem from applying
    Golem = 62,
    Herald = 63,
    AuraDebuff = 64, -- Used by Death Aura, added by Blasphemy
    Type65 = 65, -- Excludes Ruthless from Cyclone
    Type66 = 66, -- Allows Iron Will
    SpellCanCascade = 67, -- Spell can cascade via Spell Cascade
    SkillCanVolley = 68, -- Skill can be supported by Volley
    SkillCanMirageArcher = 69, -- Skill can be supported by Mirage Archer
    Type70 = 70, -- Excludes Volley from Vaal Fireball and Vaal Spark
    Type71 = 71, -- Excludes Volley from Spectral Shield Throw
    Type72 = 72, -- Excludes Summon Phantasm on Kill from Manifest Dancing Dervish
    Type73 = 73, -- Allows LMP/GMP on Rain of Arrows and Toxic Rain
    Warcry = 74, -- Warcry
    Instant = 75, -- Instant cast skill
    Brand = 76,
    DestroysCorpse = 77, -- Consumes corpses on use
    NonHitChill = 78,
    ChillingArea = 79,
}
-- List of modifier forms
local formList = {
    ["^(%d+)%% increased"] = "INC",
    ["^(%d+)%% faster"] = "INC",
    ["^(%d+)%% reduced"] = "RED",
    ["^(%d+)%% slower"] = "RED",
    ["^(%d+)%% more"] = "MORE",
    ["^(%d+)%% less"] = "LESS",
    ["^([%+%-][%d%.]+)%%?"] = "BASE",
    ["^([%+%-][%d%.]+)%%? to"] = "BASE",
    ["^([%+%-]?[%d%.]+)%%? of"] = "BASE",
    ["^([%+%-][%d%.]+)%%? base"] = "BASE",
    ["^([%+%-]?[%d%.]+)%%? additional"] = "BASE",
    ["^you gain ([%d%.]+)"] = "BASE",
    ["^gains? ([%d%.]+)%% of"] = "BASE",
    ["^([%+%-]?%d+)%% chance"] = "CHANCE",
    ["^([%+%-]?%d+)%% additional chance"] = "CHANCE",
    ["penetrates? (%d+)%%"] = "PEN",
    ["penetrates (%d+)%% of"] = "PEN",
    ["penetrates (%d+)%% of enemy"] = "PEN",
    ["^([%d%.]+) (.+) regenerated per second"] = "REGENFLAT",
    ["^([%d%.]+)%% (.+) regenerated per second"] = "REGENPERCENT",
    ["^([%d%.]+)%% of (.+) regenerated per second"] = "REGENPERCENT",
    ["^regenerate ([%d%.]+) (.+) per second"] = "REGENFLAT",
    ["^regenerate ([%d%.]+)%% (.+) per second"] = "REGENPERCENT",
    ["^regenerate ([%d%.]+)%% of (.+) per second"] = "REGENPERCENT",
    ["^regenerate ([%d%.]+)%% of your (.+) per second"] = "REGENPERCENT",
    ["^([%d%.]+) (%a+) damage taken per second"] = "DEGEN",
    ["^([%d%.]+) (%a+) damage per second"] = "DEGEN",
    ["(%d+) to (%d+) added (%a+) damage"] = "DMG",
    ["(%d+)%-(%d+) added (%a+) damage"] = "DMG",
    ["(%d+) to (%d+) additional (%a+) damage"] = "DMG",
    ["(%d+)%-(%d+) additional (%a+) damage"] = "DMG",
    ["^(%d+) to (%d+) (%a+) damage"] = "DMG",
    ["adds (%d+) to (%d+) (%a+) damage"] = "DMG",
    ["adds (%d+)%-(%d+) (%a+) damage"] = "DMG",
    ["adds (%d+) to (%d+) (%a+) damage to attacks"] = "DMGATTACKS",
    ["adds (%d+)%-(%d+) (%a+) damage to attacks"] = "DMGATTACKS",
    ["adds (%d+) to (%d+) (%a+) attack damage"] = "DMGATTACKS",
    ["adds (%d+)%-(%d+) (%a+) attack damage"] = "DMGATTACKS",
    ["adds (%d+) to (%d+) (%a+) damage to spells"] = "DMGSPELLS",
    ["adds (%d+)%-(%d+) (%a+) damage to spells"] = "DMGSPELLS",
    ["adds (%d+) to (%d+) (%a+) spell damage"] = "DMGSPELLS",
    ["adds (%d+)%-(%d+) (%a+) spell damage"] = "DMGSPELLS",
    ["adds (%d+) to (%d+) (%a+) damage to attacks and spells"] = "DMGBOTH",
    ["adds (%d+)%-(%d+) (%a+) damage to attacks and spells"] = "DMGBOTH",
    ["adds (%d+) to (%d+) (%a+) damage to spells and attacks"] = "DMGBOTH", -- o_O
    ["adds (%d+)%-(%d+) (%a+) damage to spells and attacks"] = "DMGBOTH", -- o_O
    ["adds (%d+) to (%d+) (%a+) damage to hits"] = "DMGBOTH",
    ["adds (%d+)%-(%d+) (%a+) damage to hits"] = "DMGBOTH",
}
-- Map of modifier names
local modNameList = {
    -- Attributes
    ["strength"] = "Str",
    ["dexterity"] = "Dex",
    ["intelligence"] = "Int",
    ["strength and dexterity"] = { "Str", "Dex" },
    ["strength and intelligence"] = { "Str", "Int" },
    ["dexterity and intelligence"] = { "Dex", "Int" },
    ["attributes"] = { "Str", "Dex", "Int" },
    ["all attributes"] = { "Str", "Dex", "Int" },
    -- Life/mana
    ["life"] = "Life",
    ["maximum life"] = "Life",
    ["mana"] = "Mana",
    ["maximum mana"] = "Mana",
    ["mana regeneration"] = "ManaRegen",
    ["mana regeneration rate"] = "ManaRegen",
    ["mana cost"] = "ManaCost",
    ["mana cost of"] = "ManaCost",
    ["mana cost of skills"] = "ManaCost",
    ["total mana cost of skills"] = "ManaCost",
    ["mana reserved"] = "ManaReserved",
    ["mana reservation"] = "ManaReserved",
    ["mana reservation of skills"] = "ManaReserved",
    -- Primary defences
    ["maximum energy shield"] = "EnergyShield",
    ["energy shield recharge rate"] = "EnergyShieldRecharge",
    ["start of energy shield recharge"] = "EnergyShieldRechargeFaster",
    ["armour"] = "Armour",
    ["evasion"] = "Evasion",
    ["evasion rating"] = "Evasion",
    ["energy shield"] = "EnergyShield",
    ["armour and evasion"] = "ArmourAndEvasion",
    ["armour and evasion rating"] = "ArmourAndEvasion",
    ["evasion rating and armour"] = "ArmourAndEvasion",
    ["armour and energy shield"] = "ArmourAndEnergyShield",
    ["evasion rating and energy shield"] = "EvasionAndEnergyShield",
    ["evasion and energy shield"] = "EvasionAndEnergyShield",
    ["armour, evasion and energy shield"] = "Defences",
    ["defences"] = "Defences",
    ["to evade"] = "EvadeChance",
    ["chance to evade"] = "EvadeChance",
    ["to evade attacks"] = "EvadeChance",
    ["chance to evade attacks"] = "EvadeChance",
    ["chance to evade projectile attacks"] = "ProjectileEvadeChance",
    ["chance to evade melee attacks"] = "MeleeEvadeChance",
    -- Resistances
    ["physical damage reduction"] = "PhysicalDamageReduction",
    ["physical damage reduction from hits"] = "PhysicalDamageReductionWhenHit",
    ["fire resistance"] = "FireResist",
    ["maximum fire resistance"] = "FireResistMax",
    ["cold resistance"] = "ColdResist",
    ["maximum cold resistance"] = "ColdResistMax",
    ["lightning resistance"] = "LightningResist",
    ["maximum lightning resistance"] = "LightningResistMax",
    ["chaos resistance"] = "ChaosResist",
    ["fire and cold resistances"] = { "FireResist", "ColdResist" },
    ["fire and lightning resistances"] = { "FireResist", "LightningResist" },
    ["cold and lightning resistances"] = { "ColdResist", "LightningResist" },
    ["elemental resistances"] = "ElementalResist",
    ["all elemental resistances"] = "ElementalResist",
    ["all resistances"] = { "ElementalResist", "ChaosResist" },
    ["all maximum elemental resistances"] = { "FireResistMax", "ColdResistMax", "LightningResistMax" },
    ["all maximum resistances"] = { "FireResistMax", "ColdResistMax", "LightningResistMax", "ChaosResistMax" },
    ["fire and chaos resistances"] = { "FireResist", "ChaosResist" },
    ["cold and chaos resistances"] = { "ColdResist", "ChaosResist" },
    ["lightning and chaos resistances"] = { "LightningResist", "ChaosResist" },
    -- Damage taken
    ["damage taken"] = "DamageTaken",
    ["damage taken when hit"] = "DamageTakenWhenHit",
    ["damage taken from damage over time"] = "DamageTakenOverTime",
    ["physical damage taken"] = "PhysicalDamageTaken",
    ["physical damage from hits taken"] = "PhysicalDamageTaken",
    ["physical damage taken when hit"] = "PhysicalDamageTakenWhenHit",
    ["physical damage taken over time"] = "PhysicalDamageTakenOverTime",
    ["lightning damage taken"] = "LightningDamageTaken",
    ["lightning damage from hits taken"] = "LightningDamageTaken",
    ["lightning damage taken when hit"] = "LightningDamageTakenWhenHit",
    ["lightning damage taken over time"] = "LightningDamageTakenOverTime",
    ["cold damage taken"] = "ColdDamageTaken",
    ["cold damage from hits taken"] = "ColdDamageTaken",
    ["cold damage taken when hit"] = "ColdDamageTakenWhenHit",
    ["cold damage taken over time"] = "ColdDamageTakenOverTime",
    ["fire damage taken"] = "FireDamageTaken",
    ["fire damage from hits taken"] = "FireDamageTaken",
    ["fire damage taken when hit"] = "FireDamageTakenWhenHit",
    ["fire damage taken over time"] = "FireDamageTakenOverTime",
    ["chaos damage taken"] = "ChaosDamageTaken",
    ["chaos damage from hits taken"] = "ChaosDamageTaken",
    ["chaos damage taken when hit"] = "ChaosDamageTakenWhenHit",
    ["chaos damage taken over time"] = "ChaosDamageTakenOverTime",
    ["elemental damage taken"] = "ElementalDamageTaken",
    ["elemental damage taken when hit"] = "ElementalDamageTakenWhenHit",
    ["elemental damage taken over time"] = "ElementalDamageTakenOverTime",
    -- Other defences
    ["to dodge attacks"] = "AttackDodgeChance",
    ["to dodge attack hits"] = "AttackDodgeChance",
    ["to dodge spells"] = "SpellDodgeChance",
    ["to dodge spell hits"] = "SpellDodgeChance",
    ["to dodge spell damage"] = "SpellDodgeChance",
    ["to dodge attacks and spells"] = { "AttackDodgeChance", "SpellDodgeChance" },
    ["to dodge attacks and spell damage"] = { "AttackDodgeChance", "SpellDodgeChance" },
    ["to dodge attack and spell hits"] = { "AttackDodgeChance", "SpellDodgeChance" },
    ["to block"] = "BlockChance",
    ["to block attacks"] = "BlockChance",
    ["to block attack damage"] = "BlockChance",
    ["block chance"] = "BlockChance",
    ["block chance with staves"] = { "BlockChance", tag = { type = "Condition", var = "UsingStaff" } },
    ["to block with staves"] = { "BlockChance", tag = { type = "Condition", var = "UsingStaff" } },
    ["spell block chance"] = "SpellBlockChance",
    ["to block spells"] = "SpellBlockChance",
    ["to block spell damage"] = "SpellBlockChance",
    ["chance to block attacks and spells"] = { "BlockChance", "SpellBlockChance" },
    ["maximum block chance"] = "BlockChanceMax",
    ["maximum chance to block attack damage"] = "BlockChanceMax",
    ["maximum chance to block spell damage"] = "SpellBlockChanceMax",
    ["to avoid being stunned"] = "AvoidStun",
    ["to avoid being shocked"] = "AvoidShock",
    ["to avoid being frozen"] = "AvoidFrozen",
    ["to avoid being chilled"] = "AvoidChilled",
    ["to avoid being ignited"] = "AvoidIgnite",
    ["to avoid elemental ailments"] = { "AvoidShock", "AvoidFrozen", "AvoidChilled", "AvoidIgnite" },
    ["to avoid elemental status ailments"] = { "AvoidShock", "AvoidFrozen", "AvoidChilled", "AvoidIgnite" },
    ["to avoid bleeding"] = "AvoidBleed",
    ["damage is taken from mana before life"] = "DamageTakenFromManaBeforeLife",
    ["damage taken from mana before life"] = "DamageTakenFromManaBeforeLife",
    ["effect of curses on you"] = "CurseEffectOnSelf",
    ["life recovery rate"] = "LifeRecoveryRate",
    ["mana recovery rate"] = "ManaRecoveryRate",
    ["energy shield recovery rate"] = "EnergyShieldRecoveryRate",
    ["recovery rate of life, mana and energy shield"] = { "LifeRecoveryRate", "ManaRecoveryRate", "EnergyShieldRecoveryRate" },
    -- Stun/knockback modifiers
    ["stun recovery"] = "StunRecovery",
    ["stun and block recovery"] = "StunRecovery",
    ["block and stun recovery"] = "StunRecovery",
    ["stun threshold"] = "StunThreshold",
    ["block recovery"] = "BlockRecovery",
    ["enemy stun threshold"] = "EnemyStunThreshold",
    ["stun duration on enemies"] = "EnemyStunDuration",
    ["stun duration"] = "EnemyStunDuration",
    ["to knock enemies back on hit"] = "EnemyKnockbackChance",
    ["knockback distance"] = "EnemyKnockbackDistance",
    -- Auras/curses/buffs
    ["aura effect"] = "AuraEffect",
    ["effect of non-curse auras you cast"] = "AuraEffect",
    ["effect of non-curse auras from your skills"] = "AuraEffect",
    ["effect of your curses"] = "CurseEffect",
    ["effect of auras on you"] = "AuraEffectOnSelf",
    ["effect of auras on your minions"] = { "AuraEffectOnSelf", addToMinion = true },
    ["curse effect"] = "CurseEffect",
    ["curse duration"] = { "Duration", keywordFlags = KeywordFlag.Curse },
    ["radius of auras"] = { "AreaOfEffect", keywordFlags = KeywordFlag.Aura },
    ["radius of curses"] = { "AreaOfEffect", keywordFlags = KeywordFlag.Curse },
    ["buff effect"] = "BuffEffect",
    ["effect of buffs on you"] = "BuffEffectOnSelf",
    ["effect of buffs granted by your golems"] = { "BuffEffect", tag = { type = "SkillType", skillType = SkillType.Golem } },
    ["effect of buffs granted by socketed golem skills"] = { "BuffEffect", addToSkill = { type = "SocketedIn", slotName = "{SlotName}", keyword = "golem" } },
    ["effect of the buff granted by your stone golems"] = { "BuffEffect", tag = { type = "SkillName", skillName = "Summon Stone Golem" } },
    ["effect of the buff granted by your lightning golems"] = { "BuffEffect", tag = { type = "SkillName", skillName = "Summon Lightning Golem" } },
    ["effect of the buff granted by your ice golems"] = { "BuffEffect", tag = { type = "SkillName", skillName = "Summon Ice Golem" } },
    ["effect of the buff granted by your flame golems"] = { "BuffEffect", tag = { type = "SkillName", skillName = "Summon Flame Golem" } },
    ["effect of the buff granted by your chaos golems"] = { "BuffEffect", tag = { type = "SkillName", skillName = "Summon Chaos Golem" } },
    ["effect of offering spells"] = { "BuffEffect", tag = { type = "SkillName", skillNameList = { "Bone Offering", "Flesh Offering", "Spirit Offering" } } },
    ["effect of heralds on you"] = { "BuffEffect", tag = { type = "SkillType", skillType = SkillType.Herald } },
    ["warcry effect"] = { "BuffEffect", keywordFlags = KeywordFlag.Warcry },
    ["aspect of the avian buff effect"] = { "BuffEffect", tag = { type = "SkillName", skillName = "Aspect of the Avian" } },
    -- Charges
    ["maximum power charge"] = "PowerChargesMax",
    ["maximum power charges"] = "PowerChargesMax",
    ["minimum power charge"] = "PowerChargesMin",
    ["minimum power charges"] = "PowerChargesMin",
    ["power charge duration"] = "PowerChargesDuration",
    ["maximum frenzy charge"] = "FrenzyChargesMax",
    ["maximum frenzy charges"] = "FrenzyChargesMax",
    ["minimum frenzy charge"] = "FrenzyChargesMin",
    ["minimum frenzy charges"] = "FrenzyChargesMin",
    ["frenzy charge duration"] = "FrenzyChargesDuration",
    ["maximum endurance charge"] = "EnduranceChargesMax",
    ["maximum endurance charges"] = "EnduranceChargesMax",
    ["minimum endurance charge"] = "EnduranceChargesMin",
    ["minimum endurance charges"] = "EnduranceChargesMin",
    ["endurance charge duration"] = "EnduranceChargesDuration",
    ["maximum frenzy charges and maximum power charges"] = { "FrenzyChargesMax", "PowerChargesMax" },
    ["endurance, frenzy and power charge duration"] = { "PowerChargesDuration", "FrenzyChargesDuration", "EnduranceChargesDuration" },
    ["maximum siphoning charge"] = "SiphoningChargesMax",
    ["maximum siphoning charges"] = "SiphoningChargesMax",
    ["maximum number of crab barriers"] = "CrabBarriersMax",
    -- On hit/kill/leech effects
    ["life gained on kill"] = "LifeOnKill",
    ["mana gained on kill"] = "ManaOnKill",
    ["life gained for each enemy hit"] = { "LifeOnHit" },
    ["life gained for each enemy hit by attacks"] = { "LifeOnHit", flags = ModFlag.Attack },
    ["life gained for each enemy hit by your attacks"] = { "LifeOnHit", flags = ModFlag.Attack },
    ["life gained for each enemy hit by spells"] = { "LifeOnHit", flags = ModFlag.Spell },
    ["life gained for each enemy hit by your spells"] = { "LifeOnHit", flags = ModFlag.Spell },
    ["mana gained for each enemy hit by attacks"] = { "ManaOnHit", flags = ModFlag.Attack },
    ["mana gained for each enemy hit by your attacks"] = { "ManaOnHit", flags = ModFlag.Attack },
    ["energy shield gained for each enemy hit"] = { "EnergyShieldOnHit" },
    ["energy shield gained for each enemy hit by attacks"] = { "EnergyShieldOnHit", flags = ModFlag.Attack },
    ["energy shield gained for each enemy hit by your attacks"] = { "EnergyShieldOnHit", flags = ModFlag.Attack },
    ["life and mana gained for each enemy hit"] = { "LifeOnHit", "ManaOnHit", flags = ModFlag.Attack },
    ["damage as life"] = "DamageLifeLeech",
    ["life leeched per second"] = "LifeLeechRate",
    ["mana leeched per second"] = "ManaLeechRate",
    ["maximum life per second to maximum life leech rate"] = "MaxLifeLeechRate",
    ["maximum mana per second to maximum mana leech rate"] = "MaxManaLeechRate",
    -- Projectile modifiers
    ["projectile"] = "ProjectileCount",
    ["projectiles"] = "ProjectileCount",
    ["projectile speed"] = "ProjectileSpeed",
    ["arrow speed"] = { "ProjectileSpeed", flags = ModFlag.Bow },
    -- Totem/trap/mine modifiers
    ["totem placement speed"] = "TotemPlacementSpeed",
    ["totem life"] = "TotemLife",
    ["totem duration"] = "TotemDuration",
    ["maximum number of summoned totems"] = "ActiveTotemLimit",
    ["trap throwing speed"] = "TrapThrowingSpeed",
    ["trap trigger area of effect"] = "TrapTriggerAreaOfEffect",
    ["trap duration"] = "TrapDuration",
    ["cooldown recovery speed for throwing traps"] = { "CooldownRecovery", keywordFlags = KeywordFlag.Trap },
    ["mine laying speed"] = "MineLayingSpeed",
    ["mine detonation area of effect"] = "MineDetonationAreaOfEffect",
    ["mine duration"] = "MineDuration",
    -- Minion modifiers
    ["maximum number of skeletons"] = "ActiveSkeletonLimit",
    ["maximum number of zombies"] = "ActiveZombieLimit",
    ["number of zombies allowed"] = "ActiveZombieLimit",
    ["maximum number of spectres"] = "ActiveSpectreLimit",
    ["maximum number of golems"] = "ActiveGolemLimit",
    ["maximum number of summoned golems"] = "ActiveGolemLimit",
    ["maximum number of summoned raging spirits"] = "ActiveRagingSpiritLimit",
    ["maximum number of summoned holy relics"] = "ActiveHolyRelicLimit",
    ["minion duration"] = { "Duration", tag = { type = "SkillType", skillType = SkillType.CreateMinion } },
    ["skeleton duration"] = { "Duration", tag = { type = "SkillName", skillName = "Summon Skeleton" } },
    ["sentinel of dominance duration"] = { "Duration", tag = { type = "SkillName", skillName = "Dominating Blow" } },
    -- Other skill modifiers
    ["radius"] = "AreaOfEffect",
    ["radius of area skills"] = "AreaOfEffect",
    ["area of effect radius"] = "AreaOfEffect",
    ["area of effect"] = "AreaOfEffect",
    ["area of effect of skills"] = "AreaOfEffect",
    ["area of effect of area skills"] = "AreaOfEffect",
    ["aspect of the spider area of effect"] = { "AreaOfEffect", tag = { type = "SkillName", skillName = "Aspect of the Spider" } },
    ["firestorm explosion area of effect"] = { "AreaOfEffectSecondary", tag = { type = "SkillName", skillName = "Firestorm" } },
    ["duration"] = "Duration",
    ["skill effect duration"] = "Duration",
    ["chaos skill effect duration"] = { "Duration", keywordFlags = KeywordFlag.Chaos },
    ["aspect of the spider debuff duration"] = { "Duration", tag = { type = "SkillName", skillName = "Aspect of the Spider" } },
    ["fire trap burning ground duration"] = { "Duration", tag = { type = "SkillName", skillName = "Fire Trap" } },
    ["cooldown recovery"] = "CooldownRecovery",
    ["cooldown recovery speed"] = "CooldownRecovery",
    ["weapon range"] = "WeaponRange",
    ["melee weapon range"] = "MeleeWeaponRange",
    ["melee weapon and unarmed range"] = { "MeleeWeaponRange", "UnarmedRange" },
    ["melee weapon and unarmed attack range"] = { "MeleeWeaponRange", "UnarmedRange" },
    ["to deal double damage"] = "DoubleDamageChance",
    ["activation frequency"] = "BrandActivationFrequency",
    ["brand activation frequency"] = "BrandActivationFrequency",
    -- Buffs
    ["onslaught effect"] = "OnslaughtEffect",
    ["fortify duration"] = "FortifyDuration",
    ["effect of fortify on you"] = "FortifyEffectOnSelf",
    ["effect of tailwind on you"] = "TailwindEffectOnSelf",
    -- Basic damage types
    ["damage"] = "Damage",
    ["physical damage"] = "PhysicalDamage",
    ["lightning damage"] = "LightningDamage",
    ["cold damage"] = "ColdDamage",
    ["fire damage"] = "FireDamage",
    ["chaos damage"] = "ChaosDamage",
    ["non-chaos damage"] = "NonChaosDamage",
    ["elemental damage"] = "ElementalDamage",
    -- Other damage forms
    ["attack damage"] = { "Damage", flags = ModFlag.Attack },
    ["attack physical damage"] = { "PhysicalDamage", flags = ModFlag.Attack },
    ["physical attack damage"] = { "PhysicalDamage", flags = ModFlag.Attack },
    ["physical weapon damage"] = { "PhysicalDamage", flags = ModFlag.Weapon },
    ["physical damage with weapons"] = { "PhysicalDamage", flags = ModFlag.Weapon },
    ["physical melee damage"] = { "PhysicalDamage", flags = ModFlag.Melee },
    ["melee physical damage"] = { "PhysicalDamage", flags = ModFlag.Melee },
    ["projectile damage"] = { "Damage", flags = ModFlag.Projectile },
    ["projectile attack damage"] = { "Damage", flags = ... },
    ["bow damage"] = { "Damage", flags = ModFlag.Bow },
    ["damage with arrow hits"] = { "Damage", flags = ... },
    ["wand damage"] = { "Damage", flags = ModFlag.Wand },
    ["wand physical damage"] = { "PhysicalDamage", flags = ModFlag.Wand },
    ["claw physical damage"] = { "PhysicalDamage", flags = ModFlag.Claw },
    ["sword physical damage"] = { "PhysicalDamage", flags = ModFlag.Sword },
    ["damage over time"] = { "Damage", flags = ModFlag.Dot },
    ["physical damage over time"] = { "PhysicalDamage", keywordFlags = KeywordFlag.PhysicalDot },
    ["burning damage"] = { "FireDamage", keywordFlags = KeywordFlag.FireDot },
    ["damage with ignite"] = { "Damage", keywordFlags = KeywordFlag.Ignite },
    ["damage with ignites"] = { "Damage", keywordFlags = KeywordFlag.Ignite },
    ["incinerate damage for each stage"] = { "Damage", tagList = { { type = "Multiplier", var = "IncinerateStage" }, { type = "SkillName", skillName = "Incinerate" } } },
    ["non-ailment chaos damage over time multiplier"] = "ChaosDotMultiplier",
    ["cold damage over time multiplier"] = "ColdDotMultiplier",
    -- Crit/accuracy/speed modifiers
    ["critical strike chance"] = "CritChance",
    ["attack critical strike chance"] = { "CritChance", flags = ModFlag.Attack },
    ["critical strike multiplier"] = "CritMultiplier",
    ["accuracy"] = "Accuracy",
    ["accuracy rating"] = "Accuracy",
    ["minion accuracy rating"] = { "Accuracy", addToMinion = true },
    ["attack speed"] = { "Speed", flags = ModFlag.Attack },
    ["cast speed"] = { "Speed", flags = ModFlag.Cast },
    ["attack and cast speed"] = "Speed",
    ["attack and movement speed"] = { "Speed", "MovementSpeed" },
    -- Elemental ailments
    ["to shock"] = "EnemyShockChance",
    ["shock chance"] = "EnemyShockChance",
    ["to freeze"] = "EnemyFreezeChance",
    ["freeze chance"] = "EnemyFreezeChance",
    ["to ignite"] = "EnemyIgniteChance",
    ["ignite chance"] = "EnemyIgniteChance",
    ["to freeze, shock and ignite"] = { "EnemyFreezeChance", "EnemyShockChance", "EnemyIgniteChance" },
    ["effect of shock"] = "EnemyShockEffect",
    ["effect of chill"] = "EnemyChillEffect",
    ["effect of chill on you"] = "SelfChillEffect",
    ["effect of non-damaging ailments"] = { "EnemyShockEffect", "EnemyChillEffect", "EnemyFreezeEffech" },
    ["shock duration"] = "EnemyShockDuration",
    ["freeze duration"] = "EnemyFreezeDuration",
    ["chill duration"] = "EnemyChillDuration",
    ["ignite duration"] = "EnemyIgniteDuration",
    ["duration of elemental ailments"] = { "EnemyShockDuration", "EnemyFreezeDuration", "EnemyChillDuration", "EnemyIgniteDuration" },
    ["duration of elemental status ailments"] = { "EnemyShockDuration", "EnemyFreezeDuration", "EnemyChillDuration", "EnemyIgniteDuration" },
    ["duration of ailments"] = { "EnemyShockDuration", "EnemyFreezeDuration", "EnemyChillDuration", "EnemyIgniteDuration", "EnemyPoisonDuration", "EnemyBleedDuration" },
    -- Other ailments
    ["to poison"] = "PoisonChance",
    ["to cause poison"] = "PoisonChance",
    ["to poison on hit"] = "PoisonChance",
    ["poison duration"] = { "EnemyPoisonDuration" },
    ["duration of poisons you inflict"] = { "EnemyPoisonDuration" },
    ["to cause bleeding"] = "BleedChance",
    ["to cause bleeding on hit"] = "BleedChance",
    ["to inflict bleeding"] = "BleedChance",
    ["to inflict bleeding on hit"] = "BleedChance",
    ["bleed duration"] = { "EnemyBleedDuration" },
    ["bleeding duration"] = { "EnemyBleedDuration" },
    -- Misc modifiers
    ["movement speed"] = "MovementSpeed",
    ["attack, cast and movement speed"] = { "Speed", "MovementSpeed" },
    ["light radius"] = "LightRadius",
    ["rarity of items found"] = "LootRarity",
    ["quantity of items found"] = "LootQuantity",
    ["item quantity"] = "LootQuantity",
    ["strength requirement"] = "StrRequirement",
    ["dexterity requirement"] = "DexRequirement",
    ["intelligence requirement"] = "IntRequirement",
    ["attribute requirements"] = { "StrRequirement", "DexRequirement", "IntRequirement" },
    ["effect of socketed jewels"] = "SocketedJewelEffect",
    -- Flask modifiers
    ["effect"] = "FlaskEffect",
    ["effect of flasks"] = "FlaskEffect",
    ["effect of flasks on you"] = "FlaskEffect",
    ["amount recovered"] = "FlaskRecovery",
    ["life recovered"] = "FlaskRecovery",
    ["mana recovered"] = "FlaskRecovery",
    ["life recovery from flasks"] = "FlaskLifeRecovery",
    ["mana recovery from flasks"] = "FlaskManaRecovery",
    ["flask effect duration"] = "FlaskDuration",
    ["recovery speed"] = "FlaskRecoveryRate",
    ["recovery rate"] = "FlaskRecoveryRate",
    ["flask recovery rate"] = "FlaskRecoveryRate",
    ["flask recovery speed"] = "FlaskRecoveryRate",
    ["flask life recovery rate"] = "FlaskLifeRecoveryRate",
    ["flask mana recovery rate"] = "FlaskManaRecoveryRate",
    ["extra charges"] = "FlaskCharges",
    ["maximum charges"] = "FlaskCharges",
    ["charges used"] = "FlaskChargesUsed",
    ["flask charges used"] = "FlaskChargesUsed",
    ["flask charges gained"] = "FlaskChargesGained",
    ["charge recovery"] = "FlaskChargeRecovery",
}
local function scan(line, patternList, plain)
    local bestIndex, bestEndIndex
    local bestPattern = ""
    local bestVal, bestStart, bestEnd, bestCaps
    local lineLower = line:lower()
    for pattern, patternVal in pairs(patternList) do
        local index, endIndex, cap1, cap2, cap3, cap4, cap5 = lineLower:find(pattern, 1, plain)
        if index and (not bestIndex or index < bestIndex or (index == bestIndex and (endIndex > bestEndIndex or (endIndex == bestEndIndex and #pattern > #bestPattern)))) then
            bestIndex = index
            bestEndIndex = endIndex
            bestPattern = pattern
            bestVal = patternVal
            bestStart = index
            bestEnd = endIndex
            bestCaps = { cap1, cap2, cap3, cap4, cap5 }
        end
    end
    if bestPattern then
        return bestPattern, line:sub(1, bestStart - 1) .. line:sub(bestEnd + 1, -1), bestCaps
    else
        return "nothing", line
    end
end

function parseMod(line)
    line = scan(line, modNameList, true)
    --end scanning
    return line
end