require("options")
require("core.lazy")
require("keymaps")
require("autocommands")
require("remove_comments")

-- Function to inspect LSP capabilities and trigger characters
local function inspect_lsp_capabilities()
    local clients = vim.lsp.get_clients({ bufnr = 0 })

    if #clients == 0 then
        print("No LSP clients attached to current buffer")
        return
    end

    for _, client in ipairs(clients) do
        print("\n=== LSP Client: " .. client.name .. " ===")

        local caps = client.server_capabilities
        if not caps then
            print("No server capabilities found")
            goto continue
        end

        -- Check completion provider capabilities
        if caps.completionProvider then
            print("Completion Provider: YES")

            -- Trigger characters
            if caps.completionProvider.triggerCharacters then
                print("Trigger Characters: " .. vim.inspect(caps.completionProvider.triggerCharacters))
            else
                print("Trigger Characters: NONE")
            end

            -- All commit characters
            if caps.completionProvider.allCommitCharacters then
                print("All Commit Characters: " .. vim.inspect(caps.completionProvider.allCommitCharacters))
            else
                print("All Commit Characters: NONE")
            end

            -- Resolve provider
            if caps.completionProvider.resolveProvider then
                print("Resolve Provider: YES")
            else
                print("Resolve Provider: NO")
            end

            -- Work done progress
            if caps.completionProvider.workDoneProgress then
                print("Work Done Progress: YES")
            else
                print("Work Done Progress: NO")
            end
        else
            print("Completion Provider: NO")
        end

        -- Signature help trigger characters (also relevant for completion)
        if caps.signatureHelpProvider and caps.signatureHelpProvider.triggerCharacters then
            print("Signature Help Triggers: " .. vim.inspect(caps.signatureHelpProvider.triggerCharacters))
        end

        ::continue::
    end
end

-- Create a command to easily call this function
vim.api.nvim_create_user_command("LspInspectTriggers", inspect_lsp_capabilities, {})
