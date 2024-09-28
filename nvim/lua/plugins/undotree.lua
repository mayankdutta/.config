return {
    "jiaoshijie/undotree", 
    dependencies = "nvim-lua/plenary.nvim", 
    config = true, 
    keys = {
        { "<leader>o", "<cmd>lua require('undotree').toggle()<cr>" },
    }
}