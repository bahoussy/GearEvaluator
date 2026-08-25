local ADDON_NAME, addon = ...

addon.SpecWeights = {

    [250] = { -- Blood Death Knight
        ITEM_MOD_CRIT_RATING_SHORT    = 0.30,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.70,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.55,
        ITEM_MOD_VERSATILITY          = 0.80,
    },

    [251] = { -- Frost Death Knight
        ITEM_MOD_CRIT_RATING_SHORT    = 0.80,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.70,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.55,
        ITEM_MOD_VERSATILITY          = 0.30,
    },

    [252] = { -- Unholy Death Knight
        ITEM_MOD_CRIT_RATING_SHORT    = 0.55,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.80,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.75,
        ITEM_MOD_VERSATILITY          = 0.30,
    },


    [577] = { -- Havoc Demon Hunter
        ITEM_MOD_CRIT_RATING_SHORT    = 0.65,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.80,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.55,
        ITEM_MOD_VERSATILITY          = 0.30,
    },

    [581] = { -- Vengeance Demon Hunter
        ITEM_MOD_CRIT_RATING_SHORT    = 0.25,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.80,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.55,
        ITEM_MOD_VERSATILITY          = 0.75,
    },

    [1480] = { -- Devourer Demon Hunter
        ITEM_MOD_CRIT_RATING_SHORT    = 0.75,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.70,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.60,
        ITEM_MOD_VERSATILITY          = 0.30,
    },


    [102] = { -- Balance Druid
        ITEM_MOD_CRIT_RATING_SHORT    = 0.60,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.80,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.75,
        ITEM_MOD_VERSATILITY          = 0.30,
    },

    [103] = { -- Feral Druid
        ITEM_MOD_CRIT_RATING_SHORT    = 0.65,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.75,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.85,
        ITEM_MOD_VERSATILITY          = 0.35,
    },

    [104] = { -- Guardian Druid
        ITEM_MOD_CRIT_RATING_SHORT    = 0.25,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.80,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.65,
        ITEM_MOD_VERSATILITY          = 0.75,
    },

    [105] = { -- Restoration Druid
        ITEM_MOD_CRIT_RATING_SHORT    = 0.65,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.80,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.75,
        ITEM_MOD_VERSATILITY          = 0.40,
    },


    [1467] = { -- Devastation Evoker
        ITEM_MOD_CRIT_RATING_SHORT    = 0.75,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.60,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.80,
        ITEM_MOD_VERSATILITY          = 0.35,
    },

    [1468] = { -- Preservation Evoker
        ITEM_MOD_CRIT_RATING_SHORT    = 0.80,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.75,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.60,
        ITEM_MOD_VERSATILITY          = 0.40,
    },

    [1473] = { -- Augmentation Evoker
        ITEM_MOD_CRIT_RATING_SHORT    = 0.60,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.80,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.70,
        ITEM_MOD_VERSATILITY          = 0.50,
    },


    [253] = { -- Beast Mastery Hunter
        ITEM_MOD_CRIT_RATING_SHORT    = 0.65,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.75,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.90,
        ITEM_MOD_VERSATILITY          = 0.35,
    },

    [254] = { -- Marksmanship Hunter
        ITEM_MOD_CRIT_RATING_SHORT    = 1.00,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.30,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.85,
        ITEM_MOD_VERSATILITY          = 0.60,
    },

    [255] = { -- Survival Hunter
        ITEM_MOD_CRIT_RATING_SHORT    = 0.75,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.85,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.65,
        ITEM_MOD_VERSATILITY          = 0.35,
    },


    [62] = { -- Arcane Mage
        ITEM_MOD_CRIT_RATING_SHORT    = 0.65,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.60,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.90,
        ITEM_MOD_VERSATILITY          = 0.35,
    },

    [63] = { -- Fire Mage
        ITEM_MOD_CRIT_RATING_SHORT    = 0.40,
        ITEM_MOD_HASTE_RATING_SHORT   = 1.00,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.80,
        ITEM_MOD_VERSATILITY          = 0.30,
    },

    [64] = { -- Frost Mage
        ITEM_MOD_CRIT_RATING_SHORT    = 0.85,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.60,
        ITEM_MOD_MASTERY_RATING_SHORT = 1.00,
        ITEM_MOD_VERSATILITY          = 0.30,
    },


    [268] = { -- Brewmaster Monk
        ITEM_MOD_CRIT_RATING_SHORT    = 0.35,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.80,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.70,
        ITEM_MOD_VERSATILITY          = 0.85,
    },

    [269] = { -- Windwalker Monk
        ITEM_MOD_CRIT_RATING_SHORT    = 0.80,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.35,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.85,
        ITEM_MOD_VERSATILITY          = 0.40,
    },

    [270] = { -- Mistweaver Monk
        ITEM_MOD_CRIT_RATING_SHORT    = 0.80,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.75,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.60,
        ITEM_MOD_VERSATILITY          = 0.40,
    },


    [65] = { -- Holy Paladin
        ITEM_MOD_CRIT_RATING_SHORT    = 0.85,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.80,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.65,
        ITEM_MOD_VERSATILITY          = 0.45,
    },

    [66] = { -- Protection Paladin
        ITEM_MOD_CRIT_RATING_SHORT    = 0.30,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.85,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.70,
        ITEM_MOD_VERSATILITY          = 0.80,
    },

    [70] = { -- Retribution Paladin
        ITEM_MOD_CRIT_RATING_SHORT    = 0.80,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.70,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.75,
        ITEM_MOD_VERSATILITY          = 0.35,
    },


    [256] = { -- Discipline Priest
        ITEM_MOD_CRIT_RATING_SHORT    = 0.75,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.85,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.70,
        ITEM_MOD_VERSATILITY          = 0.35,
    },

    [257] = { -- Holy Priest
        ITEM_MOD_CRIT_RATING_SHORT    = 0.80,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.85,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.65,
        ITEM_MOD_VERSATILITY          = 0.40,
    },

    [258] = { -- Shadow Priest
        ITEM_MOD_CRIT_RATING_SHORT    = 0.70,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.90,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.80,
        ITEM_MOD_VERSATILITY          = 0.35,
    },


    [259] = { -- Assassination Rogue
        ITEM_MOD_CRIT_RATING_SHORT    = 0.75,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.70,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.90,
        ITEM_MOD_VERSATILITY          = 0.30,
    },

    [260] = { -- Outlaw Rogue
        ITEM_MOD_CRIT_RATING_SHORT    = 0.90,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.95,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.35,
        ITEM_MOD_VERSATILITY          = 0.50,
    },

    [261] = { -- Subtlety Rogue
        ITEM_MOD_CRIT_RATING_SHORT    = 0.65,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.80,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.90,
        ITEM_MOD_VERSATILITY          = 0.30,
    },


    [262] = { -- Elemental Shaman
        ITEM_MOD_CRIT_RATING_SHORT    = 0.75,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.85,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.65,
        ITEM_MOD_VERSATILITY          = 0.35,
    },

    [263] = { -- Enhancement Shaman
        ITEM_MOD_CRIT_RATING_SHORT    = 0.65,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.85,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.80,
        ITEM_MOD_VERSATILITY          = 0.30,
    },

    [264] = { -- Restoration Shaman
        ITEM_MOD_CRIT_RATING_SHORT    = 0.75,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.85,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.65,
        ITEM_MOD_VERSATILITY          = 0.40,
    },


    [265] = { -- Affliction Warlock
        ITEM_MOD_CRIT_RATING_SHORT    = 0.65,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.85,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.90,
        ITEM_MOD_VERSATILITY          = 0.30,
    },

    [266] = { -- Demonology Warlock
        ITEM_MOD_CRIT_RATING_SHORT    = 0.70,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.85,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.90,
        ITEM_MOD_VERSATILITY          = 0.30,
    },

    [267] = { -- Destruction Warlock
        ITEM_MOD_CRIT_RATING_SHORT    = 0.85,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.75,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.80,
        ITEM_MOD_VERSATILITY          = 0.30,
    },


    [71] = { -- Arms Warrior
        ITEM_MOD_CRIT_RATING_SHORT    = 0.80,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.45,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.85,
        ITEM_MOD_VERSATILITY          = 0.35,
    },

    [72] = { -- Fury Warrior
        ITEM_MOD_CRIT_RATING_SHORT    = 0.80,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.85,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.65,
        ITEM_MOD_VERSATILITY          = 0.35,
    },

    [73] = { -- Protection Warrior
        ITEM_MOD_CRIT_RATING_SHORT    = 0.30,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.85,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.65,
        ITEM_MOD_VERSATILITY          = 0.80,
    },


    -- Fallback for an unknown/new specialization
    default = {
        ITEM_MOD_CRIT_RATING_SHORT    = 0.32,
        ITEM_MOD_HASTE_RATING_SHORT   = 0.61,
        ITEM_MOD_MASTERY_RATING_SHORT = 0.42,
        ITEM_MOD_VERSATILITY          = 0.04,
    },
}