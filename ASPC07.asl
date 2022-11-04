// script made by Gabriel Dornelles
// last update: 04/11/2022

state("game", "v1.1.0 (EUR/PAL) - With language selection")
{
    short stage_id_01 : 0x4F966E4; // used to identify the current area and split in doors.
    short stage_id_02 : 0x3004B5C; // used to identify the current area, start campaigns and reset the timer in main menu.

    byte plaga_samples_01      : 0x3004E64; // stores the first, second and last plaga samples we collect.
    byte plaga_samples_02      : 0x3004E6B; // stores the third and fourth plaga samples we collect.
    byte last_item_collected   : 0x2FFD1AC; // stores the last item we taken.
    byte assignment_start      : 0x4F966F0; // used to start assignment ada campaign.
    byte end_of_chapter_active : 0x2FFE56A; // used to split when a chapter ends.
    byte sw_end                : 0x4FA5D89; // used to do the last split in separate ways campaign.

    bool cutscene_active    : 0x4FA402E; // used to know if a cutscene is playing
    bool loading_active     : 0x2FFD277; // used to know if the game is loading
    bool options_active     : 0x2FFEC09; // used to know if the options screen is active.
    bool map_active         : 0x15D3D9B; // used to know if the map screen is active.
    bool death_active       : 0x5234A26; // used to know if the death screen is active.
}

state("game", "v1.1.0 (JPN/NTSC) - No language selection")
{
    short stage_id_01 : 0x4F976E4;
    short stage_id_02 : 0x3005B5C;

    byte plaga_samples_01      : 0x3005E64;
    byte plaga_samples_02      : 0x3005E6B;
    byte last_item_collected   : 0x2FFE1AC;
    byte assignment_start      : 0x4F976F0;
    byte end_of_chapter_active : 0x2FFF56A;
    byte sw_end                : 0x4FA6D89;

    bool cutscene_active    : 0x4FA502E;
    bool loading_active     : 0x2FFE277;
    bool options_active     : 0x2FFFC09;
    bool map_active         : 0x15D454B;
    bool death_active       : 0x5235A26;
}

state("game", "v1.0.0 (EUR/PAL) - With language selection")
{
    short stage_id_01 : 0x4E1F560;
    short stage_id_02 : 0x2FE6E5C;

    byte plaga_samples_01      : 0x2FE7164;
    byte plaga_samples_02      : 0x2FE716B;
    byte last_item_collected   : 0x2FDF96C;
    byte assignment_start      : 0x4E1F56C;
    byte end_of_chapter_active : 0x2FE097A;
    byte sw_end                : 0x4E2E9F1;

    bool cutscene_active    : 0x4E2CD56;
    bool loading_active     : 0x2FDFA37;
    bool options_active     : 0x2FE0F09;
    bool map_active         : 0x15B659B;
    bool death_active       : 0x50BF1BC;
}

state("game", "v1.0.0 (EUR/PAL) - No language selection")
{
    short stage_id_01 : 0x4E21560;
    short stage_id_02 : 0x2FE8E5C;

    byte plaga_samples_01      : 0x2FE9164;
    byte plaga_samples_02      : 0x2FE916B;
    byte last_item_collected   : 0x2FE196C;
    byte assignment_start      : 0x4E2156C;
    byte end_of_chapter_active : 0x2FE297A;
    byte sw_end                : 0x4E30A51;

    bool cutscene_active    : 0x4E2ED66;
    bool loading_active     : 0x2FE1A37;
    bool options_active     : 0x2FE2F09;
    bool map_active         : 0x15D3E93;
    bool death_active       : 0x50C11FC;
}

startup
{
    // campaigns
    settings.Add("main_campaign", true, "Main Campaign");
    settings.Add("separate_ways", true, "Separate Ways");
    settings.Add("assignment_ada", true, "Assignment Ada");

    // chapters - auto split
    settings.Add("main_campaign_use_chapter_auto_split", true, "Chapters - Auto Split", "main_campaign");
    settings.Add("separate_ways_use_chapter_auto_split", true, "Chapters - Auto Split", "separate_ways");

    // key items - auto split
    settings.Add("main_campaign_use_key_items_auto_split", false, "Key items - Auto Split", "main_campaign");
    settings.Add("separate_ways_use_key_items_auto_split", false, "Key items - Auto Split", "separate_ways");

    // plaga samples - auto split
    settings.Add("assignment_ada_use_plaga_samples_auto_split", true, "Plaga Samples - Auto Split", "assignment_ada");

    // all chapters (main campaign)
    settings.Add("main_campaign_chapter_1",  true, "Chapter 1-1", "main_campaign_use_chapter_auto_split");
    settings.Add("main_campaign_chapter_2",  true, "Chapter 1-2", "main_campaign_use_chapter_auto_split");
    settings.Add("main_campaign_chapter_3",  true, "Chapter 1-3", "main_campaign_use_chapter_auto_split");
    settings.Add("main_campaign_chapter_4",  true, "Chapter 2-1", "main_campaign_use_chapter_auto_split");
    settings.Add("main_campaign_chapter_5",  true, "Chapter 2-2", "main_campaign_use_chapter_auto_split");
    settings.Add("main_campaign_chapter_6",  true, "Chapter 2-3", "main_campaign_use_chapter_auto_split");
    settings.Add("main_campaign_chapter_7",  true, "Chapter 3-1", "main_campaign_use_chapter_auto_split");
    settings.Add("main_campaign_chapter_8",  true, "Chapter 3-2", "main_campaign_use_chapter_auto_split");
    settings.Add("main_campaign_chapter_9",  true, "Chapter 3-3", "main_campaign_use_chapter_auto_split");
    settings.Add("main_campaign_chapter_10", true, "Chapter 3-4", "main_campaign_use_chapter_auto_split");
    settings.Add("main_campaign_chapter_11", true, "Chapter 4-1", "main_campaign_use_chapter_auto_split");
    settings.Add("main_campaign_chapter_12", true, "Chapter 4-2", "main_campaign_use_chapter_auto_split");
    settings.Add("main_campaign_chapter_13", true, "Chapter 4-3", "main_campaign_use_chapter_auto_split");
    settings.Add("main_campaign_chapter_14", true, "Chapter 4-4", "main_campaign_use_chapter_auto_split");
    settings.Add("main_campaign_chapter_15", true, "Chapter 5-1", "main_campaign_use_chapter_auto_split");
    settings.Add("main_campaign_chapter_16", true, "Chapter 5-2", "main_campaign_use_chapter_auto_split");
    settings.Add("main_campaign_chapter_17", true, "Chapter 5-3", "main_campaign_use_chapter_auto_split");
    settings.Add("main_campaign_chapter_18", true, "Chapter 5-4", "main_campaign_use_chapter_auto_split");

    // all chapters (separate ways)
    settings.Add("separate_ways_chapter_1", true, "Chapter 1", "separate_ways_use_chapter_auto_split");
    settings.Add("separate_ways_chapter_2", true, "Chapter 2", "separate_ways_use_chapter_auto_split");
    settings.Add("separate_ways_chapter_3", true, "Chapter 3", "separate_ways_use_chapter_auto_split");
    settings.Add("separate_ways_chapter_4", true, "Chapter 4", "separate_ways_use_chapter_auto_split");
    settings.Add("separate_ways_chapter_5", true, "Chapter 5", "separate_ways_use_chapter_auto_split");

    // key items (main campaign)
    settings.Add("main_campaign_item_164", true, "Emblem (Right half)",              "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_165", true, "Emblem (Left half)",               "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_59",  true, "Insignia Key",                     "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_60",  true, "Round Insignia",                   "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_139", true, "Old Key",                          "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_140", true, "Camp Key",                         "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_61",  true, "False Eye",                        "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_128", true, "Golden Sword",                     "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_196", true, "Platinum Sword",                   "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_167", true, "Castle Gate Key",                  "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_195", true, "Prison Key",                       "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_163", true, "Gallery Key",                      "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_31",  true, "Goat Ornament",                    "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_58",  true, "Moonstone (Right half)",           "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_105", true, "Moonstone (Left half)",            "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_29",  true, "Stone Tablet",                     "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_15",  true, "Salazar Family Insignia",          "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_57",  true, "Serpent Ornament",                 "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_30",  true, "Lion Ornament",                    "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_111", true, "Queen's Grail",                    "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_110", true, "King's Grail",                     "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_141", true, "Dynamite",                         "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_123", true, "Key to the Mine",                  "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_130", true, "Stone of Sacrifice",               "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_132", true, "Freezer Card Key",                 "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_146", true, "Waste Disposal Card Key",          "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_131", true, "Storage Room Card Key",            "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_135", true, "Piece of the Holy Beast, Eagle",   "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_134", true, "Piece of the Holy Beast, Serpent", "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_116", true, "Emergency Lock Card Key",          "main_campaign_use_key_items_auto_split");
    settings.Add("main_campaign_item_136", true, "Jet-Ski Key",                      "main_campaign_use_key_items_auto_split");

    // key items (separate ways)
    settings.Add("separate_ways_item_59",  true, "Insignia Key",            "separate_ways_use_key_items_auto_split");
    settings.Add("separate_ways_item_118", true, "Green Catseye",           "separate_ways_use_key_items_auto_split");
    settings.Add("separate_ways_item_60",  true, "Round Insignia",          "separate_ways_use_key_items_auto_split");
    settings.Add("separate_ways_item_129", true, "Iron Key",                "separate_ways_use_key_items_auto_split");
    settings.Add("separate_ways_item_142", true, "Lift Activation Key",     "separate_ways_use_key_items_auto_split");
    settings.Add("separate_ways_item_27",  true, "Hourglass w/ gold decor", "separate_ways_use_key_items_auto_split");
    settings.Add("separate_ways_item_49",  true, "Activation Key (blue)",   "separate_ways_use_key_items_auto_split");
    settings.Add("separate_ways_item_51",  true, "Activation Key (red)",    "separate_ways_use_key_items_auto_split");

    // plaga samples (assignment ada)
    settings.Add("assignment_ada_plaga_sample_8",  true, "Plaga Sample 1", "assignment_ada_use_plaga_samples_auto_split");
    settings.Add("assignment_ada_plaga_sample_12", true, "Plaga Sample 2", "assignment_ada_use_plaga_samples_auto_split");
    settings.Add("assignment_ada_plaga_sample_64", true, "Plaga Sample 3", "assignment_ada_use_plaga_samples_auto_split");
    settings.Add("assignment_ada_plaga_sample_80", true, "Plaga Sample 4", "assignment_ada_use_plaga_samples_auto_split");
    settings.Add("assignment_ada_plaga_sample_28", true, "Plaga Sample 5", "assignment_ada_use_plaga_samples_auto_split");

    // door - auto split
    settings.Add("door_auto_split", true, "Door - Auto Split");

    // tool tips (main campaign)
    settings.SetToolTip("main_campaign",                          "Use ASL in Main Campaign"                        );
    settings.SetToolTip("main_campaign_use_chapter_auto_split",   "Split automatically when a chapter ends"         );
    settings.SetToolTip("main_campaign_use_key_items_auto_split", "Split automatically when a key item is collected");

    // tool tips (separate ways)
    settings.SetToolTip("separate_ways",                          "Use ASL in Separate Ways campaign"               );
    settings.SetToolTip("separate_ways_use_chapter_auto_split",   "Split automatically when a chapter ends"         );
    settings.SetToolTip("separate_ways_use_key_items_auto_split", "Split automatically when a key item is collected");

    // tool tips (assignment ada)
    settings.SetToolTip("assignment_ada",                              "Use ASL in Assignment Ada campaign"                  );
    settings.SetToolTip("assignment_ada_use_plaga_samples_auto_split", "Split automatically when a Plaga Sample is collected");

    // tool tip (door split)
    settings.SetToolTip("door_auto_split", "Split automatically when the current stage change");
}

init
{
    // set refresh rate
    refreshRate = 30;

    // get hash and set version
    var md5 = System.Security.Cryptography.MD5.Create();
    string hash = BitConverter.ToString(md5.ComputeHash(File.OpenRead(modules.First().FileName))).Replace("-", String.Empty).ToUpper();

    switch(hash)
    {
        case "B374531D70B52AA6699F3EAE1CDF362D": version = "v1.1.0 (EUR/PAL) - With language selection"; break;
        case "428018EBC0C43B90CFFF4B15B5730ED0": version = "v1.1.0 (JPN/NTSC) - No language selection";  break;
        case "B29D9A923D9C168457E9E0A4B3F274E7": version = "v1.0.0 (EUR/PAL) - With language selection"; break;
        case "20D18F8BBA177D4CF6EB603C5768C1DA": version = "v1.0.0 (EUR/PAL) - No language selection";   break;
        default: version = ""; break; // unknown version
    }

    // vars
    vars.cutscenes_count    = 0;
    vars.chapters_count     = 0;
    vars.can_start_campaign = false;
    vars.current_campaign   = String.Empty;
    vars.collected_items    = new List<byte>();
    vars.blacklisted_doors  = new Dictionary<int, Tuple<int, int>>();
    vars.timer_model        = new TimerModel{ CurrentState = timer };

    // actions
    Action reset_vars = () => {
        vars.cutscenes_count    = 0;
        vars.chapters_count     = 0;
        vars.can_start_campaign = false;
        vars.current_campaign   = String.Empty;
        vars.collected_items.Clear();
        vars.blacklisted_doors.Clear();
    };
    
    vars.reset_vars = reset_vars;
}

start
{
    if(vars.current_campaign == String.Empty)
    {
        // update "can_start_campaign" var.
        if(current.stage_id_02 != old.stage_id_02 && old.stage_id_02 == 288)
        {
            if(current.stage_id_02 == 256 || current.stage_id_02 == 1280 || current.stage_id_02 == 1029) vars.can_start_campaign = true;
        }

        // start each campaign
        if(vars.can_start_campaign)
        {
            if(current.stage_id_02 == 256 && settings["main_campaign"] && old.loading_active && !current.loading_active)
            {
                vars.can_start_campaign = false;
                vars.current_campaign   = "main_campaign";

                vars.blacklisted_doors.Add(1,  Tuple.Create( 262,260 ));
                vars.blacklisted_doors.Add(2,  Tuple.Create( 267,283 ));
                vars.blacklisted_doors.Add(3,  Tuple.Create( 527,518 ));
                vars.blacklisted_doors.Add(4,  Tuple.Create( 525,518 ));
                vars.blacklisted_doors.Add(5,  Tuple.Create( 533,553 ));
                vars.blacklisted_doors.Add(6,  Tuple.Create( 555,544 ));
                vars.blacklisted_doors.Add(7,  Tuple.Create( 541,549 ));
                vars.blacklisted_doors.Add(8,  Tuple.Create( 549,550 ));
                vars.blacklisted_doors.Add(9,  Tuple.Create( 554,768 ));
                vars.blacklisted_doors.Add(10, Tuple.Create( 783,820 ));
                vars.blacklisted_doors.Add(11, Tuple.Create( 789,790 ));
                vars.blacklisted_doors.Add(12, Tuple.Create( 790,778 ));
                vars.blacklisted_doors.Add(13, Tuple.Create( 778,790 ));
                vars.blacklisted_doors.Add(14, Tuple.Create( 796,800 ));
                vars.blacklisted_doors.Add(15, Tuple.Create( 818,817 ));

                return true;
            }

            else if(current.stage_id_02 == 1280 && settings["separate_ways"] && old.map_active && !current.map_active)
            {
                vars.can_start_campaign = false;
                vars.current_campaign   = "separate_ways";

                vars.blacklisted_doors.Add(1, Tuple.Create( 1283,1286 ));
                vars.blacklisted_doors.Add(2, Tuple.Create( 1289,1294 ));
                vars.blacklisted_doors.Add(3, Tuple.Create( 1292,1298 ));
                vars.blacklisted_doors.Add(4, Tuple.Create( 1303,1304 ));

                return true;
            }

            else if(current.stage_id_02 == 1029 && settings["assignment_ada"] && old.assignment_start == 87 && current.assignment_start < 87)
            {
                vars.can_start_campaign = false;
                vars.current_campaign   = "assignment_ada";
                return true;
            }
        }
    }
}

split
{
    if(vars.current_campaign != String.Empty)
    {
        // chapters split
        if(current.end_of_chapter_active != old.end_of_chapter_active && current.end_of_chapter_active == 128)
        {
            vars.chapters_count++;
            return settings[vars.current_campaign + "_chapter_" + vars.chapters_count];
        }

        // key items split
        if(current.last_item_collected != old.last_item_collected && !vars.collected_items.Contains(current.last_item_collected))
        {
            if(settings.ContainsKey(vars.current_campaign + "_item_" + current.last_item_collected))
            {
                vars.collected_items.Add(current.last_item_collected);
                return settings[vars.current_campaign + "_item_" + current.last_item_collected];
            }
        }

        // plaga samples split
        if(current.plaga_samples_01 > old.plaga_samples_01 || current.plaga_samples_02 > old.plaga_samples_02)
        {
            if(!vars.collected_items.Contains(current.plaga_samples_01) && settings.ContainsKey("assignment_ada_plaga_sample_" + current.plaga_samples_01))
            {
                vars.collected_items.Add(current.plaga_samples_01);
                return settings["assignment_ada_plaga_sample_" + current.plaga_samples_01];
            }

            else if(!vars.collected_items.Contains(current.plaga_samples_02) && settings.ContainsKey("assignment_ada_plaga_sample_" + current.plaga_samples_02))
            {
                vars.collected_items.Add(current.plaga_samples_02);
                return settings["assignment_ada_plaga_sample_" + current.plaga_samples_02];
            }
        }

        // door split
        if(settings["door_auto_split"] && current.stage_id_01 != old.stage_id_01)
        {
            return !vars.blacklisted_doors.ContainsValue(Tuple.Create( (int)old.stage_id_01, (int)current.stage_id_01 ));
        }

        // end split (main campaign)
        if(vars.current_campaign == "main_campaign" && current.stage_id_01 == 819)
        {
            // update "cutscenes_count" var.
            if(!old.cutscene_active && current.cutscene_active) vars.cutscenes_count++;

            // reset "cutscenes_count" var.
            if(!old.death_active && current.death_active) vars.cutscenes_count = 0;

            // split
            if(vars.cutscenes_count == 2) { vars.cutscenes_count = 0; return true; }
        }

        // end split (separate ways)
        if(vars.current_campaign == "separate_ways" && current.stage_id_01 == 1310) return current.sw_end != old.sw_end && current.sw_end == 64;

        // end split (assignment ada)
        if(vars.current_campaign == "assignment_ada" && current.stage_id_01 == 1038) return !old.cutscene_active && current.cutscene_active;
    }
}

isLoading
{
    return current.cutscene_active || current.loading_active || current.options_active;
}

onReset
{
    vars.reset_vars();
}

reset
{
    if(current.stage_id_02 != old.stage_id_02 && current.stage_id_02 == 288)
    {
        vars.reset_vars();
        return true;
    }
}

exit
{
    vars.reset_vars();

    if(timer.CurrentPhase > 0) vars.timer_model.Pause();
}
