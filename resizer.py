from PIL import Image
import os
def resize_image(image_path, output_path,scale=0.5):
    if not os.path.exists(output_path):
            os.makedirs(output_path)
    image_files = [f for f in os.listdir(image_path) if f.lower().endswith((".png", ".jpg", ".jpeg"))]
    # Open the image
    for each in image_files:
        with Image.open(os.path.join(image_path,each)) as img:
            width, height = img.size
            resized_img = img.resize((int(width*scale), int(height*scale)))
            resized_img.save(os.path.join(output_path,each[:-5]+'_new.jpeg'))



resize_image(r'C:\Users\eemrk\OneDrive\Masaüstü\image_to_hex', r'C:\Users\eemrk\OneDrive\Masaüstü\image_to_hex\new_images')


