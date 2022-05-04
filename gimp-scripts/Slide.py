import sys

LEFT = "left"
RIGHT = "right"
UP = "up"
DOWN = "down"

direction = RIGHT
step_size_px = 8 # For best results, this should be a factor of the image direction where the slide is happening
frame_time_ms = 50 # Must be multiple of 10 per the GIF standard
replacement_policy = 2 # 1=combine, 2=replace

# Tune this if the output is too big
num_colors = 128

img = pdb.file_png_load(sys.argv[1], 1) # file name, non-interactive load
outfile = sys.argv[2] + '.{}.gif'.format(direction)
orig_width, orig_height = img.width, img.height


if direction in (LEFT, RIGHT):
    num_steps = img.width // step_size_px
elif direction in (UP, DOWN):
    num_steps = img.height // step_size_px
else:
    assert False, "Invalid slide direction %s" % direction

img.disable_undo()
drw = pdb.gimp_image_active_drawable(img)

pdb.plug_in_tile(img, drw, 3*img.width, 3*img.height, False) # image, drawable, new width, new height, don't create new image

# Make 3 copies of the base layer
for i in range(1, num_steps):
    layer = pdb.gimp_layer_copy(img.layers[-1], False) # Don't add transparency
    if direction == LEFT:
        translated_layer = pdb.gimp_item_transform_translate(layer, -step_size_px * i, 0)
    elif direction == RIGHT:
        translated_layer = pdb.gimp_item_transform_translate(layer, step_size_px * i, 0)
    elif direction == UP:
        translated_layer = pdb.gimp_item_transform_translate(layer, 0, -step_size_px * i)
    elif direction == DOWN:
        translated_layer = pdb.gimp_item_transform_translate(layer, 0, step_size_px * i)
    img.add_layer(translated_layer)

pdb.gimp_image_crop(img, orig_width, orig_height, orig_width, orig_height)

# Image, no dithering, make optimal palette, # colors, dither alpha channel,
# remove unused colors (ignored), name of custom palette (ignored)
pdb.gimp_image_convert_indexed(img, 0, 0, num_colors, False, False, "")
drw = pdb.gimp_image_get_active_drawable(img)
# Image, drawable, filename, raw filename, interlaced, loop forever, ms between frames, replace frames
pdb.file_gif_save(img, drw, outfile, outfile, 0, 1, frame_time_ms, replacement_policy, run_mode=1)
