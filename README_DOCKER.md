# DivX Perceptual Hash Docker Image

This repository aims to create a usable docker image for the video and image perceptual hashing contained under the pHash directory, which is a fork of the [Perceptual Hash Github Repository](https://github.com/aetilius/pHash). 

## Building the image
Make sure you are in the root directory where the Dockerfile is located.
Run:
`docker build -t ubuntu-phash .`
You can substitute `ubuntu-phash` for whichever image name you prefer.

## Running the image in Windows
After you have built the docker image, if in a Windows environment run:
`winpty docker run -i -t ubuntu-phash`
Make sure the image name you provide is the same as what you supplied when building the image.

## Testing Image Hashing and Comparison

The `./TestDCT` command can be run inside the docker image in order to test the Discrete Cosine Transform Perceptual Image Hashing. Supply the command with two directories containing images for cross comparison after hashing. An example command is shown below:
```
./TestDCT ./assets/images ./assets/images
```
In the above command the images directory is compared against itself, so each image within the directory generates a Hamming Distance with all the other images in the directory.

`./TestMH` is another command to test Perceptual Image Hashing, which tests the Marr Wavelet Image Hash Algorithm. This command has not been thoroughly explored at the time this README has been written, but an exmple command is shown below:
```
./TestMH ./assets/images/chair-grey-scale-title.png ./assets/images/chair-sepia-title.png
```
Something to note is, the input of `./TestMH` compares more closely to the video hash command input than that of `.\TestDCT`. This algorithm could be further explored, time permitting.

## Testing Video Hashing and Comparison

The `./TestVideoHash` command can be run inside the docker image in order to test the Variable Length DCT Video Hashing. Supply the command with two image paths for cross comparison after the video hashes are generated. An example command is shown below:
```
./TestVideoHash ./assets/videos/chair-22-sd-grey-bar.mp4 ./assets/videos/chair-22-sd-sepia-bar.mp4
```
