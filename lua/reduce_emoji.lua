local F = {}

function F.init(env)
    local engine = env.engine
    local config = engine.schema.config
    -- env.mem = Memory(engine, engine.schema)
    env.emoji_pos = config:get_int("emoji_reduce/idx") or 6
    env.pin_mark = config:get_string("pin_word/comment_mark") or "🔝"
    --[[
    env.notifier_commit = env.engine.context.commit_notifier:connect(function(ctx)
        local cand = ctx:get_selected_candidate()
        if (cand:get_dynamic_type() == "Shadow") then
            local preedit = cand.preedit
            local cand_text = cand.comment:gsub("[〔〕]", "")
            env.mem:user_lookup(preedit, true)
            if env.mem.start_session then env.mem:start_session() end             -- new on librime 2024.05
            for entry in env.mem:iter_user() do
                if entry.text == cand_text then
                    entry.weight = -1
                    entry.commit_count = entry.commit_count - 1
                    env.mem:update_userdict(entry, 0, '')
                end
            end
            if env.mem.finish_session then env.mem:finish_session() end           -- new on librime 2024.05
        end
    end)
    --]]
end

function F.func(input, env)
    local emoji_cands  = {}
    local other_cands  = {}
    local top_cand_cnt = 0
    local engine       = env.engine
    local emoji_toggle = engine.context:get_option("emoji")
    local wechat_flag  = engine.context:get_option("wechat_flag")
    local preedit_code = engine.context.input:gsub(" ", "")

    for cand in input:iter() do
        if (top_cand_cnt <= env.emoji_pos) then
            if
                emoji_toggle
                and (cand:get_dynamic_type() == "Shadow")
                and (not cand.comment:match(env.pin_mark))
                and (not preedit_code:match("^%l+[%[`]%l?%l?$"))
                and (not (
                    cand.text:find("([\228-\233][\128-\191]-)")
                    and cand.text:lower():match("^" .. preedit_code)
                ))
            then
                table.insert(emoji_cands, cand)
            elseif (cand:get_dynamic_type() == "Shadow")
                and (
                    cand.comment:match(env.pin_mark) or (
                        cand.text:find("([\228-\233][\128-\191]-)")
                        and (cand.text:lower():match("^" .. preedit_code))
                    )
                )
            then
                yield(cand)
            elseif (cand:get_dynamic_type() ~= "Shadow") then
                yield(cand)
            end
            top_cand_cnt = top_cand_cnt + 1
        else
            table.insert(other_cands, cand)
        end
    end

    for _, emoji_cand in ipairs(emoji_cands) do
        local cand_text = emoji_cand.text
        if wechat_flag then
            yield(emoji_cand)
        elseif not cand_text:match("^%[.*%]$") then
            yield(emoji_cand)
        end
    end

    for _, cand in ipairs(other_cands) do
        local cand_text = cand.text
        if wechat_flag then
            yield(cand)
        elseif not cand_text:match("^%[.*%]$") then
            yield(cand)
        end
    end
end

--[[
function F.fini(env)
    env.notifier_commit:disconnect()
    if env.mem then
        env.mem:disconnect()
        env.mem = nil
    end
end
--]]

return F
