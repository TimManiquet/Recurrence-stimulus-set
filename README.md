# Building a stimulus set to study recurrence in visual recognition

The present repository contains resources aimed at building a dataset of images that have some visual properties suited for studying recurrence processing in visual object recognition.

## Structure
Upon usage of all its tools, this directory should have the following structure:
```
.
├── COCOimages
├── bckgrndImages
│   ├── heavy_clutter
│   ├── inputImages
│   ├── light_clutter
│   ├── scrambled_heavy_clutter
│   └── scrambled_light_clutter
├── images
├── output
│   ├── clutter
│   │   ├── heavy
│   │   └── light
│   ├── occlusionOuput
│   │   ├── blob_high
│   │   ├── blob_low
│   │   ├── deletion_high
│   │   ├── deletion_low
│   │   ├── partialViewing_high
│   │   └── partialViewing_low
│   └── scramblingOuput
│       ├── highPass
│       └── lowPass
└── scripts
    └── LGNstatistics-master
        └── CEandSCmatlab
```

## Usage
The scripts in this repository are designed to import natural images from the MS COCO dataset ([https://cocodataset.org/#home)](https://cocodataset.org/#home), segment out the object they contain, and apply a number of manipulations to the object. Here is a brief description of what each script is made for, in sequence of usage:
1. `coco_segment_instances.ipynb ` downloads images of objects from given categories found in the MS COCO database. For the sake of dependencies and memory, this script is best run in Google Colab.
2. `coco_full_images.ipynb ` downloads resized natural images from the MS COCO database. These are latter used as backgrounds. This script is also best run in Google Colab.
3. `LLmatching.ipynb` takes in the objects from `1.` and equates their pixel value histograms.
4. `LGNstatistics-master > run_clutter.mlx` takes in images downloaded from `2.` and sorts them out between highly- and lightly-cluttered images.
5. `imageScrambling.ipynb ` takes in images downloaded from `2.` and sorted out by `4.` , and scrambles them to create lightly- and highly-cluttered backgrounds.
6. `bckgrndClutter.ipynb` reads the images imported from MS COCO (from `1.` ) and outputs (1.) resized versions of each object on a plain background, and (2.) resized version of each object on cluttered backgrounds (output from `5.`).
7. `cpdImageScrambling.ipynb` takes in images with plain backgrounds from `6.`, Fourier transforms them, scrambles their phase spectrum above and below a given threshold and outputs a low- and high-pass scrambled version of images.
8. `occlusion.ipynb` takes in images with plain backgrounds from `6.` and applies occlusion manipulations on them. Three different manipulations are used: _blob_, _partial viewing_ and _deletion_; each at two different levels of difficulty: _high_ and _low_. 

All the output images created by the different manipulations are stored in the `output` folder.
