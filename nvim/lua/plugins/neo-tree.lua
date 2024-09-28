return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "s1n7ax/nvim-window-picker", 
            opts = function()
                require("window-picker").setup({

                    hint = "floating-big-letter", 
                    show_prompt = false, 

                    filter_rules = {
                        autoselect_one = false,
                    }
                })
            end,
        } 
    }
}