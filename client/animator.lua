local animationList = {
    ['rottweiler'] = {
        ['standing'] = {
            ['normal_bark'] = {
                animDictionary = 'creatures@retriever@amb@world_dog_barking@idle_a',
                animationName = 'idle_a'
            },
            ['standing_bark'] = {
                animDictionary = 'creatures@retriever@amb@world_dog_barking@idle_a',
                animationName = 'idle_b'
            },
            ['rotate_bark'] = {
                animDictionary = 'creatures@retriever@amb@world_dog_barking@idle_a',
                animationName = 'idle_c'
            }
        },
        ['siting'] = {
            ['self_itch'] = {
                animDictionary = 'creatures@retriever@amb@world_dog_sitting@idle_a',
                animationName = 'idle_a'
            },
            ['look_around'] = {
                animDictionary = 'creatures@retriever@amb@world_dog_sitting@idle_a',
                animationName = 'idle_b',
                skip = {'A_C_Westy', 'A_C_Pug', 'A_C_Poodle', 'A_C_Cat_01', 'A_C_MtLion', 'A_C_Panther'}
            },
            ['sit_Up'] = {
                animDictionary = 'creatures@retriever@amb@world_dog_sitting@idle_a',
                animationName = 'idle_c'
            },
            ['sit'] = {
                animDictionary = 'creatures@retriever@amb@world_dog_sitting@base',
                animationName = 'base'
            }
        },
        ['misc'] = {
            ['indicate_ahead'] = {
                animDictionary = 'creatures@rottweiler@indication@',
                animationName = 'indicate_ahead'
            },
            ['indicate_high'] = {
                animDictionary = 'creatures@rottweiler@indication@',
                animationName = 'indicate_high'
            },
            ['indicate_low'] = {
                animDictionary = 'creatures@rottweiler@indication@',
                animationName = 'indicate_low'
            }
        },
        ['tricks'] = {
            ['beg'] = {
                sequential = true,
                list = {
                    [1] = {
                        animDictionary = 'creatures@rottweiler@tricks@',
                        animationName = 'beg_enter'
                    },
                    [2] = {
                        animDictionary = 'creatures@rottweiler@tricks@',
                        animationName = 'beg_loop'
                    },
                    [3] = {
                        animDictionary = 'creatures@rottweiler@tricks@',
                        animationName = 'beg_exit'
                    }
                }
            },
            ['paw_right_enter'] = {
                animDictionary = 'creatures@rottweiler@tricks@',
                animationName = 'paw_right_enter'
            },
            ['paw_right_exit'] = {
                animDictionary = 'creatures@rottweiler@tricks@',
                animationName = 'paw_right_exit'
            },
            ['paw_right_loop'] = {
                animDictionary = 'creatures@rottweiler@tricks@',
                animationName = 'paw_right_loop'
            },
            ['petting_chop'] = {
                animDictionary = 'creatures@rottweiler@tricks@',
                animationName = 'petting_chop',
                skip = {'A_C_Westy', 'A_C_Pug', 'A_C_Poodle', 'A_C_Cat_01', 'A_C_MtLion', 'A_C_Panther'}
            },
            ['petting_franklin'] = { -- this is for human that is petting dog!
                animDictionary = 'creatures@rottweiler@tricks@',
                animationName = 'petting_franklin'
            }
        },
        ['hump'] = {
            ['hump_enter_chop'] = {
                animDictionary = 'creatures@rottweiler@amb@',
                animationName = 'hump_enter_chop'
            },
            ['hump_enter_ladydog'] = {
                animDictionary = 'creatures@rottweiler@amb@',
                animationName = 'hump_enter_ladydog'
            },
            ['hump_exit_chop'] = {
                animDictionary = 'creatures@rottweiler@amb@',
                animationName = 'hump_exit_chop'
            },
            ['hump_exit_ladydog'] = {
                animDictionary = 'creatures@rottweiler@amb@',
                animationName = 'hump_exit_ladydog'
            },
            ['hump_loop_chop'] = {
                animDictionary = 'creatures@rottweiler@amb@',
                animationName = 'hump_loop_chop'
            },
            ['hump_loop_ladydog'] = {
                animDictionary = 'creatures@rottweiler@amb@',
                animationName = 'hump_loop_chop'
            }
        },
        ['sleep'] = {
            ['exit_kennel'] = {
                animDictionary = 'creatures@rottweiler@amb@sleep_in_kennel@',
                animationName = 'exit_kennel'
            },
            ['sleep_in_kennel'] = {
                animDictionary = 'creatures@rottweiler@amb@sleep_in_kennel@',
                animationName = 'sleep_in_kennel'
            }
        },
        ['pickup'] = {
            ['fetch_drop'] = {
                animDictionary = 'CREATURES@ROTTWEILER@MOVE',
                animationName = 'fetch_drop'
            },
            ['fetch_pickup'] = {
                animDictionary = 'CREATURES@ROTTWEILER@MOVE',
                animationName = 'fetch_pickup'
            }
        },
        ['dump'] = {
            ['dumpi'] = {
                sequential = true,
                list = {
                    [1] = {
                        animDictionary = 'CREATURES@ROTTWEILER@MOVE',
                        animationName = 'dump_enter'
                    },
                    [2] = {
                        animDictionary = 'CREATURES@ROTTWEILER@MOVE',
                        animationName = 'dump_loop'
                    },
                    [3] = {
                        animDictionary = 'CREATURES@ROTTWEILER@MOVE',
                        animationName = 'dump_exit'
                    }
                }
            }
        },
        ['pee'] = {
            ['pee_left_enter'] = {
                animDictionary = 'CREATURES@ROTTWEILER@MOVE',
                animationName = 'pee_left_enter'
            },
            ['pee_left_exit'] = {
                animDictionary = 'CREATURES@ROTTWEILER@MOVE',
                animationName = 'pee_left_exit'
            },
            ['pee_left_idle'] = {
                animDictionary = 'CREATURES@ROTTWEILER@MOVE',
                animationName = 'pee_left_idle'
            }
        }
    },
    ['cat'] = {
        ['standing'] = {
            ['idle'] = {
                animDictionary = 'creatures@cat@move',
                animationName = 'idle'
            },
            ['idle_dwn'] = {
                animDictionary = 'creatures@cat@move',
                animationName = 'idle_dwn'
            },
            ['idle_upp'] = {
                animDictionary = 'creatures@cat@move',
                animationName = 'idle_upp'
            }
        },
        ['siting'] = {
            ['sitting'] = {
                animDictionary = 'creatures@cat@amb@world_cat_sleeping_ledge@idle_a',
                animationName = 'idle_a'
            }
        },
        ['misc'] = {},
        ['sleep'] = {
            ['enter_sleep'] = {
                animDictionary = 'creatures@cat@amb@world_cat_sleeping_ground@enter',
                animationName = 'enter'
            },
            ['sleep'] = {
                animDictionary = 'creatures@cat@amb@world_cat_sleeping_ground@base',
                animationName = 'base'
            },
            ['idle_sleep'] = {
                animDictionary = 'creatures@cat@amb@world_cat_sleeping_ground@idle_a',
                animationName = 'idle_a'
            },
            ['exit_sleep'] = {
                animDictionary = 'creatures@cat@amb@world_cat_sleeping_ground@exit',
                animationName = 'base'
            },
            ['exit2_sleep'] = {
                animDictionary = 'creatures@cat@amb@peyote@enter',
                animationName = 'enter'
            },
            ['exit_panic_sleep'] = {
                animDictionary = 'creatures@cat@amb@world_cat_sleeping_ground@exit',
                animationName = 'idle_a'
            }
        }
    },
    ['cougar'] = {
        ['standing'] = {
            ['idle'] = {
                animDictionary = 'creatures@cat@move',
                animationName = 'idle'
            }

        },
        ['siting'] = {
            ['sitting'] = {
                animDictionary = 'creatures@cat@amb@world_cat_sleeping_ledge@idle_a',
                animationName = 'idle_a'
            }
        },
        ['misc'] = {},
        ['sleep'] = {
            ['enter_sleep'] = {
                animDictionary = 'creatures@cat@amb@world_cat_sleeping_ground@enter',
                animationName = 'enter'
            }

        }
    },
    ['small'] = {
        ['standing'] = {
            ['barking'] = {
                animDictionary = 'creatures@pug@amb@world_dog_barking@idle_a',
                animationName = 'idle_a'
            },
            ['barking_idle'] = {
                animDictionary = 'creatures@pug@amb@world_dog_barking@idle_a',
                animationName = 'idle_b'
            },
            ['self_clean'] = {
                animDictionary = 'creatures@pug@amb@world_dog_barking@idle_a',
                animationName = 'idle_c'
            }
        },
        ['siting'] = {
            ['sitting_base'] = {
                animDictionary = 'creatures@pug@amb@world_dog_sitting@base',
                animationName = 'base'
            },
            ['sitting_enter'] = {
                animDictionary = 'creatures@pug@amb@world_dog_sitting@enter',
                animationName = 'enter'
            },
            ['sitting_exit'] = {
                animDictionary = 'creatures@pug@amb@world_dog_sitting@exit',
                animationName = 'exit'
            },
            ['sitting_idle_a'] = {
                animDictionary = 'creatures@pug@amb@world_dog_sitting@idle_a',
                animationName = 'idle_a'
            },
            ['sitting_idle_b'] = {
                animDictionary = 'creatures@pug@amb@world_dog_sitting@idle_a',
                animationName = 'idle_b'
            },
            ['sitting_idle_c'] = {
                animDictionary = 'creatures@pug@amb@world_dog_sitting@idle_a',
                animationName = 'idle_c'
            }
        },
        ['sleep'] = {}
    }
}

-- sort animations by ped model
local correctionList = {
    ['A_C_Husky'] = animationList.rottweiler,
    ['A_C_shepherd'] = animationList.rottweiler,
    ['A_C_Rottweiler'] = animationList.rottweiler,
    ['A_C_Retriever'] = animationList.rottweiler,
    ['A_C_Westy'] = animationList.small,
    ['A_C_Pug'] = animationList.small,
    ['A_C_Poodle'] = animationList.small,
    ['A_C_Panther'] = animationList.cougar,
    ['A_C_MtLion'] = animationList.cougar,
    ['A_C_Cat_01'] = animationList.cat
}
-- missexile2 fra0_ig_14_chop_sniff_fwds
-- missexile2 taunt_01 taunt_02
-- missfra0_chop_find chop_bark_at_ballas
-- missfra0_chop_find fra0_ig_14_chop_sniff_fwds

--- missfra1leadinoutfra_1_int_trevor _trevor_leadin_loop_chop <<<< sleep with feared face!
--- misschop_vehicle@back_of_van chop_sit_loop chop_lean_back_loop chop_growl_to_sit chop_growl chop_bark
-- fix_agy_int1-1 a_c_chop_02_dual-1 <<<< sleep
function Animator(pedHandle, pedModel, state, animation, c_timings)

    -- #TODO sequential animation
    if correctionList[pedModel] == nil or correctionList[pedModel][state] == nil or
        correctionList[pedModel][state][animation] == nil then
        return
    end
    -- sequential animation logic
    if correctionList[pedModel][state][animation].sequential ~= nil and
        correctionList[pedModel][state][animation].sequential == true then
        CreateThread(function()
            local finish = false
            local count = 1
            local size = #correctionList[pedModel][state][animation].list
            while finish == false do
                local currentAnimation = animation

                if count <= size then
                    currentAnimation = correctionList[pedModel][state][animation].list[count]
                end
                local c_animDictionary = currentAnimation.animDictionary
                local c_animationName = currentAnimation.animationName

                local timeout = 0
                if count == 1 then
                    timeout = timeout + 5
                    excuteAnimation(pedHandle, c_animDictionary, c_animationName, 'STOP_LAST_FRAME')
                elseif count == 2 then
                    excuteAnimation(pedHandle, c_animDictionary, c_animationName, 'REPEAT')
                elseif count == 3 then
                    timeout = timeout + 3
                    excuteAnimation(pedHandle, c_animDictionary, c_animationName)
                end

                local skip = false
                Wait(75)
                while IsEntityPlayingAnim(pedHandle, c_animDictionary, c_animationName, 3) == 1 and skip == false do
                    timeout = timeout + 1
                    if timeout > 6 then
                        skip = true
                    end
                    Wait(500)
                end
                count = count + 1
                if count > size then
                    finish = true
                end
            end
        end)
        -- skip rest of functions when we have to play sequential
        return
    end

    local c_animDictionary = correctionList[pedModel][state][animation].animDictionary
    local c_animationName = correctionList[pedModel][state][animation].animationName
    excuteAnimation(pedHandle, c_animDictionary, c_animationName, c_timings)
end

function excuteAnimation(pedHandle, c_animDictionary, c_animationName, c_timings)
    local flag = 0
    local slow = -1
    if c_timings ~= nil then
        if c_timings == 'REPEAT' then
            flag = 1
        elseif c_timings == 'STOP_LAST_FRAME' then
            flag = 2
        elseif c_timings == 'UPPERBODY' then
            flag = 16
        elseif c_timings == 'ENABLE_PLAYER_CONTROL' then
            flag = 32
        elseif c_timings == 'CANCELABLE' then
            flag = 120
        else
            flag = -1
        end
    end
    waitForAnimation(c_animDictionary)
    TaskPlayAnim(pedHandle, c_animDictionary, c_animationName, 8.0, -8, slow, flag, 0, false, false, false)
end