local dap = require('dap')

dap.adapters.debugpy = {
    type = 'executable',
    -- command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python';
    command = "python",
    args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
    {
        type = 'debugpy',
        request = 'launch',
        name = "Debug files",
        program = "${file}",
        -- program = "${workspaceFolder}",
        -- pythonPath = function()
        --     return '/usr/bin/python'
        -- end,
    },
    {
        type = 'debugpy',
        request = 'launch',
        name = "Debug files2",
        program = "${file}",
        -- program = "${workspaceFolder}",
        -- pythonPath = function()
        --     return '/usr/bin/python'
        -- end,
    },

}
