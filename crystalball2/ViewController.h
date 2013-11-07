//
//  ViewController.h
//  crystalball2
//
//  Created by chris on 10/14/13.
//  Copyright (c) 2013 chris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//   {
//       NSArray *predictionArray;
//   }

- (IBAction)buttonPressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UILabel *predictionLabel;

// can manually create a property which allows other controllers
// to have access to methods declared here

@property (strong, nonatomic) NSArray *predictionArray;

// added this to change text color randomly
@property (strong, nonatomic) UIColor *changeColor;
@property (strong, nonatomic) UIColor *changeColor1;
@property (strong, nonatomic) UIColor *changeColor2;
@property (strong, nonatomic) NSArray *colorArray;

// added this to complete image animation suing animationImage
@property (strong, nonatomic) UIImageView *blueView;

// define a method to encapsulate the prediction array ranomization code
- (void) makePrediction;

@end
