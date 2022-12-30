local status, rust_tools = pcall(require, "rust-tools")
if not status then
    return
end

rust_tools.setup({
    tools = {
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    server = {
        settings = {
        ["rust-analyzer"] = {
            assist = {
            importEnforceGranularity = true,
            importPrefix = "crate"
            },
            cargo = {
            allFeatures = true
            },
            checkOnSave = {
            -- default: `cargo check`
            command = "clippy"
            },
            },
            inlayHints = {
            lifetimeElisionHints = {
                enable = true,
                useParameterNames = true
            },
            },
        }
    },
})
