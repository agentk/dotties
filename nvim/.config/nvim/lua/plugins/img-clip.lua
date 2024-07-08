return {
  {
    -- support for image pasting
    'HakonHarnes/img-clip.nvim',
    -- Disabling due to noise when pasting non-images into commands
    enabled = false,
    event = 'VeryLazy',
    opts = {
      default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = false,
        drag_and_drop = {
          insert_mode = true,
        },
      },
    },
  },
}
