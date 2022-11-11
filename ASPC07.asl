// last update: 11/11/2022
// thanks to Wagner Brasil for reporting bugs in split

state("game", "1.0.0 (EUR/PAL)")
{
    long merchant_screen  : 0x4E300B4; // used to know if the merchant screen is active

    short stage_id_01     : 0x4E1F560; // used to know which map we are (to split)
    short stage_id_02     : 0x2FE6E5C; // used to know which map we are (many uses)

    byte assignment_start : 0x4E1F56C; // used to start assignment ada campaign
    byte end_of_chapter   : 0x2FE097A; // used to know if a chapter ends
    byte item             : 0x2FDF96C; // the last item we taken
    byte map_screen       : 0x2DBBEB3; // used to know if the map screen is active
    byte plaga_samples_01 : 0x2FE7164; // stores the first, second and the last plaga sample
    byte plaga_samples_02 : 0x2FE716B; // stores the third and fourth plaga sample

    bool cutscene_active  : 0x4E2CD56; // used to know if a custcene is playing
    bool death_screen     : 0x50BF1BC; // used to reset cutscenes_count var
    bool general_loading  : 0x2FDFA37; // used to know if the game is loading (to the LRT)
    bool loading_count    : 0x2FE0F4C; // used to know if the game is loading (to init campaign)
    bool options_screen   : 0x2FE0F09; // used to know if the options screen is active
}

state("game", "1.1.0 (EUR/PAL)")
{
    long merchant_screen  : 0x4FA7434;

    short stage_id_01     : 0x4F966E4;
    short stage_id_02     : 0x3004B5C;

    byte assignment_start : 0x4F966F0;
    byte end_of_chapter   : 0x2FFE56A;
    byte item             : 0x2FFD1AC;
    byte map_screen       : 0x2DD96B3;
    byte plaga_samples_01 : 0x3004E64;
    byte plaga_samples_02 : 0x3004E6B;

    bool cutscene_active  : 0x4FA402E;
    bool death_screen     : 0x5234A26;
    bool general_loading  : 0x2FFD277;
    bool loading_count    : 0x2FFEC4C;
    bool options_screen   : 0x2FFEC09;
}

state("game", "1.1.0 (JPN/NTSC)")
{
    long merchant_screen  : 0x4FA8434;

    short stage_id_01     : 0x4F976E4;
    short stage_id_02     : 0x3005B5C;

    byte assignment_start : 0x4F976F0;
    byte end_of_chapter   : 0x2FFF56A;
    byte item             : 0x2FFE1AC;
    byte map_screen       : 0x2DDA6B3;
    byte plaga_samples_01 : 0x3005E64;
    byte plaga_samples_02 : 0x3005E6B;

    bool cutscene_active  : 0x4FA502E;
    bool death_screen     : 0x5235A26;
    bool general_loading  : 0x2FFE277;
    bool loading_count    : 0x2FFFC4C;
    bool options_screen   : 0x2FFFC09;
}

startup
{
    // campaigns
    settings.Add("main_campaign",  true, "Main Campaign");
    settings.Add("separate_ways",  true, "Separate Ways");
    settings.Add("assignment_ada", true, "Assignment Ada");
    
    // main campaign sub-options
    settings.Add("main_campaign_use_init_on_map",          true,  "Init on Map",     "main_campaign");
    settings.Add("main_campaign_use_chapter_auto_split",   true,  "Chapters Split",  "main_campaign");
    settings.Add("main_campaign_use_key_items_auto_split", false, "Key items Split", "main_campaign");
    
    // separate ways sub-options
    settings.Add("separate_ways_use_init_on_map",          true,  "Init on Map",     "separate_ways");
    settings.Add("separate_ways_use_chapter_auto_split",   true,  "Chapters Split",  "separate_ways");
    settings.Add("separate_ways_use_key_items_auto_split", false, "Key items Split", "separate_ways");
    
    // assignment ada sub-options
    settings.Add("assignment_ada_use_plaga_sample_auto_split", false, "Plaga Samples Split", "assignment_ada");

    // init on map (main campaign)
    settings.Add("main_campaign_init_on_map_256", true,  "Chapter 1-1 Map",       "main_campaign_use_init_on_map");
    settings.Add("main_campaign_init_on_map_260", false, "Chapter 1-2 Map",       "main_campaign_use_init_on_map");
    settings.Add("main_campaign_init_on_map_261", false, "Chapter 1-3 Map",       "main_campaign_use_init_on_map");
    settings.Add("main_campaign_init_on_map_283", false, "Chapter 2-1 Map",       "main_campaign_use_init_on_map");
    settings.Add("main_campaign_init_on_map_279", false, "Chapter 2-2 Map",       "main_campaign_use_init_on_map");
    settings.Add("main_campaign_init_on_map_284", false, "Chapter 2-3 Map",       "main_campaign_use_init_on_map");
    settings.Add("main_campaign_init_on_map_512", false, "Chapter 3-1 Map",       "main_campaign_use_init_on_map");
    settings.Add("main_campaign_init_on_map_516", false, "Chapter 3-2 Map",       "main_campaign_use_init_on_map");
    settings.Add("main_campaign_init_on_map_523", false, "Chapter 3-3 Map",       "main_campaign_use_init_on_map");
    settings.Add("main_campaign_init_on_map_518", false, "Chapter 3-4 & 4-1 Map", "main_campaign_use_init_on_map");
    settings.Add("main_campaign_init_on_map_544", false, "Chapter 4-2 Map",       "main_campaign_use_init_on_map");
    settings.Add("main_campaign_init_on_map_549", false, "Chapter 4-3 Map",       "main_campaign_use_init_on_map");
    settings.Add("main_campaign_init_on_map_550", false, "Chapter 4-4 Map",       "main_campaign_use_init_on_map");
    settings.Add("main_campaign_init_on_map_768", false, "Chapter 5-1 Map",       "main_campaign_use_init_on_map");
    settings.Add("main_campaign_init_on_map_780", false, "Chapter 5-2 Map",       "main_campaign_use_init_on_map");
    settings.Add("main_campaign_init_on_map_790", false, "Chapter 5-3 Map",       "main_campaign_use_init_on_map");
    settings.Add("main_campaign_init_on_map_800", false, "Chapter 5-4 Map",       "main_campaign_use_init_on_map");
    settings.Add("main_campaign_init_on_map_816", false, "Final Chapter Map",     "main_campaign_use_init_on_map");

    // init on map (separate ways)
    settings.Add("separate_ways_init_on_map_1280", true,  "Chapter 1 Map", "separate_ways_use_init_on_map");
    settings.Add("separate_ways_init_on_map_1286", false, "Chapter 2 Map", "separate_ways_use_init_on_map");
    settings.Add("separate_ways_init_on_map_1294", false, "Chapter 3 Map", "separate_ways_use_init_on_map");
    settings.Add("separate_ways_init_on_map_1298", false, "Chapter 4 Map", "separate_ways_use_init_on_map");
    settings.Add("separate_ways_init_on_map_1304", false, "Chapter 5 Map", "separate_ways_use_init_on_map");

    // chapters (main campaign)
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

    // chapters (separate ways)
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
    settings.Add("assignment_ada_plaga_sample_8",  true, "Plaga Sample 1", "assignment_ada_use_plaga_sample_auto_split");
    settings.Add("assignment_ada_plaga_sample_12", true, "Plaga Sample 2", "assignment_ada_use_plaga_sample_auto_split");
    settings.Add("assignment_ada_plaga_sample_64", true, "Plaga Sample 3", "assignment_ada_use_plaga_sample_auto_split");
    settings.Add("assignment_ada_plaga_sample_80", true, "Plaga Sample 4", "assignment_ada_use_plaga_sample_auto_split");
    settings.Add("assignment_ada_plaga_sample_28", true, "Plaga Sample 5", "assignment_ada_use_plaga_sample_auto_split");

    // door split
    settings.Add("use_door_auto_split", true, "Door Split");

    // tool tips (main campaign)
    settings.SetToolTip("main_campaign", "Check if you want to use the ASL in Main Campaign");
    settings.SetToolTip("main_campaign_use_init_on_map", "The timer will start in selected maps");
    settings.SetToolTip("main_campaign_use_chapter_auto_split", "Will split when the selected chapter ends");
    settings.SetToolTip("main_campaign_use_key_items_auto_split", "Will split when the selected key item is collected");

    // tool tips (separate ways)
    settings.SetToolTip("separate_ways", "Check if you want to use the ASL in Separate Ways campaign");
    settings.SetToolTip("separate_ways_use_init_on_map", "The timer will start in selected maps");
    settings.SetToolTip("separate_ways_use_chapter_auto_split", "Will split when the selected chapter ends");
    settings.SetToolTip("separate_ways_use_key_items_auto_split", "Will split when the selected key item is collected");

    // tool tips (assignment ada)
    settings.SetToolTip("assignment_ada", "Check if you want to use the ASL in Assignment Ada campaign");
    settings.SetToolTip("assignment_ada_use_plaga_sample_auto_split", "Will split when the selected Plaga Sample is collected");

    // tool tip (door split)
    settings.SetToolTip("use_door_auto_split", "Check if you want to use door split");

    // vars
    vars.cutscenes_count           = 0;
    vars.chapters_count            = 0;
    vars.campaign                  = String.Empty;
    vars.collected_items           = new List<byte>();
    vars.blacklisted_doors         = new Dictionary<int, Tuple<int,int>>();
    vars.main_campaign_init_on_map = new List<short>{256, 260, 261, 283, 279, 284, 512, 516, 523, 518, 544, 549, 550, 768, 780, 790, 800, 816};
    vars.separate_ways_init_on_map = new List<short>{1280, 1286, 1294, 1298, 1304};
    vars.timer_model               = new TimerModel{ CurrentState = timer };

    // actions
    Action reset_vars = () => {
        vars.cutscenes_count = 0;
        vars.chapters_count  = 0;
        vars.campaign        = String.Empty;
        vars.collected_items.Clear();
        vars.blacklisted_doors.Clear();
    };

    vars.reset_vars = reset_vars;
}

init
{
    // game version
    var md5 = System.Security.Cryptography.MD5.Create();
    string hash = BitConverter.ToString(md5.ComputeHash(File.OpenRead(modules.First().FileName))).Replace("-", String.Empty).ToUpper();

    switch(hash)
    {
        case "B29D9A923D9C168457E9E0A4B3F274E7": version = "1.0.0 (EUR/PAL)"; break;
        case "B374531D70B52AA6699F3EAE1CDF362D": version = "1.1.0 (EUR/PAL)"; break;
        case "428018EBC0C43B90CFFF4B15B5730ED0": version = "1.1.0 (JPN/NTSC)"; break;
        default: version = ""; break; // unknown version
    }
}

update
{
    if(vars.campaign == "main_campaign" && vars.chapters_count == 0 && current.stage_id_01 != 256)
    {
        if(old.stage_id_01 == 518 && current.stage_id_01 == 525) vars.chapters_count = 9;  // chapter 3-4
        if(old.stage_id_01 == 518 && current.stage_id_01 == 528) vars.chapters_count = 10; // chapter 4-1
    }
}

start
{
    if(vars.campaign == String.Empty)
    {
        if(vars.main_campaign_init_on_map.Contains(current.stage_id_02) && settings["main_campaign_init_on_map_" + current.stage_id_02])
        {
            if(!old.loading_count && current.loading_count)
            {
                vars.campaign = "main_campaign";

                // set chapter
                switch((int)current.stage_id_02)
                {
                    case 256: vars.chapters_count = 0;  break; // 1-1
                    case 260: vars.chapters_count = 1;  break; // 1-2
                    case 261: vars.chapters_count = 2;  break; // 1-3
                    case 283: vars.chapters_count = 3;  break; // 2-1
                    case 279: vars.chapters_count = 4;  break; // 2-2
                    case 284: vars.chapters_count = 5;  break; // 2-3
                    case 512: vars.chapters_count = 6;  break; // 3-1
                    case 516: vars.chapters_count = 7;  break; // 3-2
                    case 523: vars.chapters_count = 8;  break; // 3-3
                    case 544: vars.chapters_count = 11; break; // 4-2
                    case 549: vars.chapters_count = 12; break; // 4-3
                    case 550: vars.chapters_count = 13; break; // 4-4
                    case 768: vars.chapters_count = 14; break; // 5-1
                    case 780: vars.chapters_count = 15; break; // 5-2
                    case 790: vars.chapters_count = 16; break; // 5-3
                    case 800: vars.chapters_count = 17; break; // 5-4
                    case 816: vars.chapters_count = 18; break; // final chapter
                }

                // update blacklisted doors
                vars.blacklisted_doors.Add(1,  Tuple.Create(262, 260));
                vars.blacklisted_doors.Add(2,  Tuple.Create(267, 283));
                vars.blacklisted_doors.Add(3,  Tuple.Create(527, 518));
                vars.blacklisted_doors.Add(4,  Tuple.Create(525, 518));
                vars.blacklisted_doors.Add(5,  Tuple.Create(536, 533));
                vars.blacklisted_doors.Add(6,  Tuple.Create(545, 555));
                vars.blacklisted_doors.Add(7,  Tuple.Create(555, 544));
                vars.blacklisted_doors.Add(8,  Tuple.Create(541, 549));
                vars.blacklisted_doors.Add(9,  Tuple.Create(549, 550));
                vars.blacklisted_doors.Add(10, Tuple.Create(554, 768));
                vars.blacklisted_doors.Add(11, Tuple.Create(783, 820));
                vars.blacklisted_doors.Add(12, Tuple.Create(789, 790));
                vars.blacklisted_doors.Add(13, Tuple.Create(790, 778));
                vars.blacklisted_doors.Add(14, Tuple.Create(778, 790));
                vars.blacklisted_doors.Add(15, Tuple.Create(796, 800));
                vars.blacklisted_doors.Add(16, Tuple.Create(818, 817));

                // start
                return true;
            }
        }

        else if (vars.separate_ways_init_on_map.Contains(current.stage_id_02) && settings["separate_ways_init_on_map_" + current.stage_id_02])
        {
            if(old.map_screen == 116 && current.map_screen == 0)
            {
                vars.campaign = "separate_ways";

                switch((int)current.stage_id_02)
                {
                    case 1280: vars.chapters_count = 0; break;
                    case 1286: vars.chapters_count = 1; break;
                    case 1294: vars.chapters_count = 2; break;
                    case 1298: vars.chapters_count = 3; break;
                    case 1304: vars.chapters_count = 4; break;
                }

                vars.blacklisted_doors.Add(1, Tuple.Create(1283, 1286));
                vars.blacklisted_doors.Add(2, Tuple.Create(1289, 1294));
                vars.blacklisted_doors.Add(3, Tuple.Create(1292, 1298));
                vars.blacklisted_doors.Add(4, Tuple.Create(1303, 1304));

                return true;
            }
        }

        else if (current.stage_id_01 == 1029)
        {
            if(settings["assignment_ada"] && old.assignment_start == 87 && current.assignment_start < 87)
            {
                vars.campaign = "assignment_ada";
                return true;
            }
        }
    }
}

split
{
    if(vars.campaign != String.Empty)
    {
        // chapters split
        if(current.end_of_chapter != old.end_of_chapter && current.end_of_chapter == 128)
        {
            vars.chapters_count++;
            return settings[vars.campaign + "_chapter_" + vars.chapters_count];
        }

        // key items split
        if(current.item != old.item && !vars.collected_items.Contains(current.item))
        {
            if(settings.ContainsKey(vars.campaign + "_item_" + current.item) && settings[vars.campaign + "_item_" + current.item])
            {
                vars.collected_items.Add(current.item);
                return true;
            }
        }

        // plaga samples split
        if(vars.campaign == "assignment_ada" && (current.plaga_samples_01 > old.plaga_samples_01 || current.plaga_samples_02 > old.plaga_samples_02))
        {
            if(!vars.collected_items.Contains(current.plaga_samples_01) && settings.ContainsKey("assignment_ada_plaga_sample_" + current.plaga_samples_01) && settings["assignment_ada_plaga_sample_" + current.plaga_samples_01])
            {
                vars.collected_items.Add(current.plaga_samples_01);
                return true;
            }

            else if(!vars.collected_items.Contains(current.plaga_samples_02) && settings.ContainsKey("assignment_ada_plaga_sample_" + current.plaga_samples_02) && settings["assignment_ada_plaga_sample_" + current.plaga_samples_02])
            {
                vars.collected_items.Add(current.plaga_samples_02);
                return true;
            }
        }

        // door split
        if(current.stage_id_01 != old.stage_id_01 && settings["use_door_auto_split"])
        {
            return !vars.blacklisted_doors.ContainsValue(Tuple.Create( (int)old.stage_id_01, (int)current.stage_id_01 ));
        }

        // main campaign final split
        if(vars.campaign == "main_campaign" && current.stage_id_01 == 819)
        {
            // update cutscenes_count
            if(!old.cutscene_active && current.cutscene_active) vars.cutscenes_count++;

            // reset cutscenes_count
            if(!old.death_screen && current.death_screen) vars.cutscenes_count = 0;

            // split
            if(vars.cutscenes_count == 2) { vars.reset_vars(); return true; }
        }

        // separate ways final split
        if(vars.campaign == "separate_ways" && current.stage_id_01 == 1310)
        {
            // update cutscenes_count
            if(!old.cutscene_active && current.cutscene_active) vars.cutscenes_count++;

            // final split
            if(vars.cutscenes_count == 2) { vars.reset_vars(); return true; }
        }
        
        // assignment ada final split
        if(vars.campaign == "assignment_ada" && current.stage_id_01 == 1038 && !old.cutscene_active && current.cutscene_active) { vars.reset_vars(); return true; }
    }
}

isLoading
{
    return current.cutscene_active || current.general_loading || current.options_screen;
}

onReset
{
    vars.reset_vars();
}

reset
{
    // reset when load a new game in separate ways
    if(vars.campaign == "separate_ways" && current.stage_id_02 == 1280)
    {
        if(current.merchant_screen != old.merchant_screen && current.merchant_screen > 0)
        {
            vars.reset_vars();
            return true;
        }
    }

    // reset in main menu
    if(current.stage_id_02 != old.stage_id_02 && current.stage_id_02 == 288)
    {
        vars.reset_vars();
        return true;
    }
}

exit
{
    vars.reset_vars();

    // pause timer when the game exit
    if(timer.CurrentPhase > 0)
    {
        vars.timer_model.Pause();
    }
}
