crystalball2
============

Using TeamTreeHouse's CrystallBall excercise to learn basic Objective-C animations

www.teamtreehouse.com

Entry level Objective-C programming

The code uses an array of images to simulate a magic crystal ball being used.  24 images are displayed in sequence 
when the user presses the 'Predict' button.  Then a 'prediction' result is displayed in one of three randomly
chosen colors.

The code makes use of arc4ramdom_uniform both to change the text color and the "prediction".  Also makes use of 
motionBegan and motionEnded to call the user defined makePrediction method.  Colors are picked randomly 
from an array of three color objects defined using UIColor.

