import sys

# file name, non-interactive load
img = pdb.file_png_load(sys.argv[1], 1)
outfile = sys.argv[2]

rotate = True
party = False
polarity = 1  # Use -1 to reverse direction of spin/colors
replacement_policy = 2 # 1=combine, 2=replace

# Tune these if the output is too big
num_steps = 24
num_colors = 48

img.disable_undo()
for step in range(0, num_steps):
    layer = pdb.gimp_layer_copy(img.layers[-1], False) # Don't add transparency
    img.add_layer(layer)
    if rotate:
        # Item, radians, auto center, center x coords (ignored), center y coords (ignored)
        pdb.gimp_item_transform_rotate(layer, polarity*step/float(num_steps)*2*3.1415926535, True, 0, 0)
    if party:
        # Item, hue (degrees), saturation, lightness
        if polarity == 1:
            pdb.gimp_drawable_colorize_hsl(layer, (step/float(num_steps)*360 + 50) % 360, 100, 0)
        else:
            pdb.gimp_drawable_colorize_hsl(layer, (360 - step/float(num_steps)*360 + 50) % 360, 100, 0)

# delete the original layer
img.remove_layer(img.layers[-1])

# Image, no dithering, make optimal palette, # colors, dither alpha channel,
# remove unused colors (ignored), name of custom palette (ignored)
pdb.gimp_image_convert_indexed(img, 0, 0, num_colors, False, False, "")
drw = pdb.gimp_image_get_active_drawable(img)
# Image, drawable, filename, raw filename, interlaced, loop forever, ms between frames, replace frames
pdb.file_gif_save(img, drw, outfile, outfile, 0, 1, 60, replacement_policy, run_mode=1)
