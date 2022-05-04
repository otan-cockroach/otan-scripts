from random import randint
import sys

# file name, non-interactive load
img = pdb.file_png_load(sys.argv[1])
outfile = sys.argv[2]

horiz_displace_pct = 17
vert_displace_pct = 17
frame_time_ms = 40 # Must be multiple of 10 per the GIF standard
replacement_policy = 2 # 1=combine, 2=replace

# Tune these if the output is too big
num_frames = 28
num_colors = 48

horiz_displace_px = int(img.width * (horiz_displace_pct/100.0))
vert_displace_px = int(img.height * (vert_displace_pct/100.0))

img.disable_undo()
# Make copies of the base layer
delta_x = randint(-horiz_displace_px, horiz_displace_px)
delta_y = randint(-vert_displace_px, vert_displace_px)
for _ in range(1, num_frames):
    layer = pdb.gimp_layer_copy(img.layers[-1], False) # Don't add transparency
    img.add_layer(layer)
    pdb.gimp_item_transform_translate(
        img.layers[0],
        delta_x,
        delta_y,
    )
    # Prevent the next frame being too close to the current one
    next_delta_x = randint(-horiz_displace_px, horiz_displace_px)
    next_delta_y = randint(-vert_displace_px, vert_displace_px)
    while abs(next_delta_x - delta_x) < horiz_displace_px * 0.15 and abs(next_delta_y - delta_y) < vert_displace_px * 0.15:
        next_delta_x = randint(-horiz_displace_px, horiz_displace_px)
        next_delta_y = randint(-vert_displace_px, vert_displace_px)
    delta_x, delta_y = next_delta_x, next_delta_y

pdb.gimp_image_crop(img, img.width, img.height, 0, 0)

# Image, no dithering, make optimal palette, # colors, dither alpha channel,
# remove unused colors (ignored), name of custom palette (ignored)
pdb.gimp_image_convert_indexed(img, 0, 0, num_colors, False, False, "")
drw = pdb.gimp_image_get_active_drawable(img)
# Image, drawable, filename, raw filename, interlaced, loop forever, ms between frames, replace frames
pdb.file_gif_save(img, drw, outfile, outfile, 0, 1, frame_time_ms, replacement_policy, run_mode=1)
