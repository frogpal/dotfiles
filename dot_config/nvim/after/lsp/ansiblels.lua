return {
    cmd = { "ansible-language-server", "--stdio" },
    filetypes = { "yaml", "yml", "ansible" },
    root_markers = { "ansible.cfg", ".ansible-lint" },
    settings = {
        ansible = {
            ansible = {
                path = "ansible",
            },
            executionEnvironment = {
                enabled = false,
            },
            python = {
                interpreterPath = "python",
            },
            validation = {
                enabled = false,
                lint = {
                    enabled = false,
                    path = "ansible-lint",
                },
            },
        },
    },
}
