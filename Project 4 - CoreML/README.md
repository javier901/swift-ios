## Food Detector App
This is a Swift app that demonstrates the use of Apple's machine learning vision framework with [CoreML](https://developer.apple.com/documentation/coreml). Using [Turi Create](https://github.com/apple/turicreate), an image classification model is trained (transfer-learning) on food images of different types. This trained [mlmodel](https://developer.apple.com/documentation/coreml/mlmodel) is then used in an iOS app for recognising pictures of food, taken with an iPhone.

### Swift topics covered
- TuriCreate to generate a coreml model
- [VNCoreMLRequest](https://developer.apple.com/documentation/vision/vncoremlrequest) & [VNImageRequestHandler](https://developer.apple.com/documentation/vision/vnimagerequesthandler) to query a Core ML model to process images
- [UIImagePickerController](https://developer.apple.com/documentation/uikit/uiimagepickercontroller) to take pictures or choose items from media gallery

Note : For simplicity, this app does not perform resize/transformation of test images before querying the model, which can generally be a good addition for such projects.

### Data

- [Food 11](https://www.epfl.ch/labs/mmspg/downloads/food-image-datasets/) dataset from EPFL \
(For simplicity, images for this project was downloaded from https://www.kaggle.com/trolukovich/food11-image-dataset where the original Food 11 data has been organized by category)

- 16643 food images across 11 classes :
  - Bread
  - Dairy product
  - Dessert
  - Egg
  - Fried food
  - Meat
  - Noodles-Pasta
  - Rice
  - Seafood
  - Soup
  - Vegetable-Fruit
- 3 splits in datase : Training, Validation & Test. \
  (Training & validation have been combined in this project for training the model, and then allowing only 5% split for validation)

Due to size limit issues, the data is not uploaded in this repository. The 2 python files `create_sframe.py` and `train.py` include the TuriCreate code used to generate the Food11.mlmodel using in the iOS app.

### Demo



### Tutorials
- Introductory [guide](https://medium.com/kinandcartacreated/intro-to-machine-learning-on-ios-with-createml-turicreate-part-2-f30f94fe8172) for TuriCreate
- Transfer learning tutorials [here](http://cs231n.github.io/transfer-learning/) and [here](https://pytorch.org/tutorials/beginner/transfer_learning_tutorial.html)
- coreml with swift tutorials [here](https://dev.to/mehmetkoca/image-recognition-with-coreml) and [here](https://www.raywenderlich.com/577-core-ml-and-vision-machine-learning-in-ios-11-tutorial).
