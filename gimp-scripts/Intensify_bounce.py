# file name, non-interactive load
import sys

img = pdb.file_png_load(sys.argv[1], 1)
outfile = sys.argv[2]

horiz_displace1_pct = 9
horiz_displace2_pct = 14
up_displace_pct = 10
down_displace_pct = 7
frame_time_ms = 70 # Must be multiple of 10 per the GIF standard
replacement_policy = 2 # 1=combine, 2=replace

img.disable_undo()
# Make 3 copies of the base layer
for _ in range(3):
    layer = pdb.gimp_layer_copy(img.layers[-1], False) # Don't add transparency
    img.add_layer(layer)

horiz_displace1_px = int(img.width * (horiz_displace1_pct/100.0))
horiz_displace2_px = int(img.width * (horiz_displace2_pct/100.0))
up_displace_px = int(img.height * (-up_displace_pct/100.0))
down_displace_px = int(img.height * (down_displace_pct/100.0))

pdb.gimp_item_transform_translate(img.layers[3], horiz_displace1_px, down_displace_px)
pdb.plug_in_gauss(img, img.layers[3], img.width * 0.015, img.height * 0.08, 1, run_mode=1)

pdb.gimp_item_transform_translate(img.layers[2], horiz_displace2_px, up_displace_px)

pdb.gimp_item_transform_translate(img.layers[1], -horiz_displace1_px, down_displace_px)
pdb.plug_in_gauss(img, img.layers[1], img.width * 0.015, img.height * 0.08, 1, run_mode=1)

pdb.gimp_item_transform_translate(img.layers[0], -horiz_displace2_px, up_displace_px)

pdb.gimp_image_crop(img, img.width, img.height, 0, 0)

# Image, no dithering, make optimal palette, # colors, dither alpha channel,
# remove unused colors (ignored), name of custom palette (ignored)
pdb.gimp_image_convert_indexed(img, 0, 0, 255, False, False, "")
drw = pdb.gimp_image_get_active_drawable(img)
# Image, drawable, filename, raw filename, interlaced, loop forever, ms between frames, replace frames
pdb.file_gif_save(img, drw, outfile, outfile, 0, 1, frame_time_ms, replacement_policy, run_mode=1)
