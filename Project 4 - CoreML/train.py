import turicreate as tc

data = tc.SFrame('Food11_train_and_valid.sframe') # Load the data
print("Step 1: Loaded data")

# model = tc.image_classifier.create(data, target='label', max_iterations=50, model="squeezenet_v1.1") # Create a model
# model = tc.image_classifier.create(data, target='label', max_iterations=100, model="squeezenet_v1.1") # Create a model
model = tc.image_classifier.create(data, target='label', max_iterations=200, model="squeezenet_v1.1") # Create a model

print("Step 2: Creating classifier with squeezenet_v1")

model.save('Food11-turi-sqz_v1-200runs.model') # Not really needed, just as an intermediary
print("Step 3: Saved Turi create model")

model.export_coreml('Food11-200runs.mlmodel')
print("Step 4: Exported as mlmodel")

# If wanting to check the test accuracy, use the code below
#
# train_data, test_data = data.random_split(0.8) # Make a train-test split
# print("Step 2: Test & Train data split at 20:80% ratio")
#
# # model = tc.image_classifier.create(train_data, target='label', max_iterations=50, model="resnet-50") # Create a model
# model = tc.image_classifier.create(train_data, target='label', max_iterations=50, model="squeezenet_v1.1") # Create a model
# print ("Step 3: Creating classifier with squeezenet_v1")
#
# # Save predictions to an SFrame (class and corresponding class-probabilities)
# predictions = model.classify(test_data)
# print("Step 4: Testing ...")
#
# # Evaluate the model and save the results into a dictionary
# results = model.evaluate(test_data)
# print ("Accuracy         : %s" % results['accuracy'])
# print ("Confusion Matrix : \n%s" % results['confusion_matrix'])
# print("Step 5 : Evaluate model!")
#
# # Save the model for later usage in Turi Create
# model.save('Food11-turi-sqz_v1.model')
# print("Step 6: Saved model")

# model = tc.load_model('Food11-turi-sqz_v1.model')
# model.export_coreml('Food11-sqz.mlmodel')
