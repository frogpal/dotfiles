local function get_ansible_python()
    local pipx_home = os.getenv("PIPX_HOME") or (os.getenv("HOME") .. ".local/share/pipx")
    return pipx_home .. "/venvs/ansible/bin/python"
end

return {
    settings = {
        ansible = {
            python = {
                interpreterPath = get_ansible_python(),
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
