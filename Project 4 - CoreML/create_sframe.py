import turicreate as tc
import os

data = tc.image_analysis.load_images("Data/Train-validation/")
path = 'Data/Train-validation/'
data["label"] = data["path"].apply(lambda path: os.path.basename(os.path.dirname(path))) # save labels

data.save('Food11_train_and_valid.sframe') # save data
data.explore() # explore




























#
