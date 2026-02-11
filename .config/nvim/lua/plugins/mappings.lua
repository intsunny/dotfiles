return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["c"] = { '"_c', desc = "Change without yanking" },
          ["dd"] = { '"_dd', desc = "Delete line without yanking" },
          ["x"] = { '"_x', desc = "Delete character without yanking" }
        }, -- end of n
        v = {
          ["c"] = { '"_c', desc = "Change without yanking" },
          ["dd"] = { '"_dd', desc = "Delete line without yanking" },
          ["x"] = { '"_x', desc = "Delete character without yanking" }
        } --end of v
      }
    }
  }
}


