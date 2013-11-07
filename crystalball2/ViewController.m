//
//  ViewController.m
//  crystalball2
//
//  Created by chris on 10/14/13.
//  Copyright (c) 2013 chris. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize predictionLabel;
@synthesize predictionArray;

@synthesize colorArray;
@synthesize changeColor;
@synthesize changeColor1;
@synthesize changeColor2;

@synthesize blueView;

//
// *** VIEW-DID-LOAD
//
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

// Load the background image
    UIImage *bluePict = [UIImage imageNamed:@"blue.png"];

//  changed the next line to allow this method to be accesed outside of the viewDidLoad method
//  UIImageView *blueView = [[UIImageView alloc] initWithImage:bluePict];
    self.blueView = [[UIImageView alloc] initWithImage:bluePict];
    
//  [self.view addSubview:blueView];
    [self.view insertSubview:self.blueView atIndex:0];
        
//    NSString *myString = @"Loaded Text";
//    [myString length];
//    [myString uppercaseString];
    
    self.blueView.animationImages = [[NSArray alloc] initWithObjects:
                                     [UIImage imageNamed:@"cball00001.png"],
                                     [UIImage imageNamed:@"cball00002.png"],
                                     [UIImage imageNamed:@"cball00003.png"],
                                     [UIImage imageNamed:@"cball00004.png"],
                                     [UIImage imageNamed:@"cball00005.png"],
                                     [UIImage imageNamed:@"cball00006.png"],
                                     [UIImage imageNamed:@"cball00007.png"],
                                     [UIImage imageNamed:@"cball00008.png"],
                                     [UIImage imageNamed:@"cball00009.png"],
                                     [UIImage imageNamed:@"cball00010.png"],
                                     [UIImage imageNamed:@"cball00011.png"],
                                     [UIImage imageNamed:@"cball00012.png"],
                                     [UIImage imageNamed:@"cball00013.png"],
                                     [UIImage imageNamed:@"cball00014.png"],
                                     [UIImage imageNamed:@"cball00015.png"],
                                     [UIImage imageNamed:@"cball00016.png"],
                                     [UIImage imageNamed:@"cball00017.png"],
                                     [UIImage imageNamed:@"cball00018.png"],
                                     [UIImage imageNamed:@"cball00019.png"],
                                     [UIImage imageNamed:@"cball00020.png"],
                                     [UIImage imageNamed:@"cball00021.png"],
                                     [UIImage imageNamed:@"cball00022.png"],
                                     [UIImage imageNamed:@"cball00023.png"],
                                     [UIImage imageNamed:@"cball00024.png"],
                                     nil];
    
    self.blueView.animationDuration = 3.5;
    self.blueView.animationRepeatCount = 1;
    
    self.predictionArray = [[NSArray alloc] initWithObjects:
                                @"Luke will surf Reddit",
                                @"Dad will watch a Treehouse video",
                                @"Catie will do homework",
                                @"Mom will run out to the store",
                                @"Dimey will bark",
                                @"Max will yelp",
                                @"Mom will check her Facebook",
                                @"Catie will send a Snapchat",
                                @"Flower will meow annoyingly",
                                @"Mom will got to Cross-fit",
                                @"Dad will work on the computer",
                                nil];
    
    // Added:CJ
    // The following was added to randomly change the prediction text color:
    // First create three different UIColor objects, and name them according to the color assigned to the object
    // I used three colors, but there's no reason that someone couldn't create more objects
    // Then create an NSArray called colorArray initialized with the three color objects.
    //
    self.changeColor = [UIColor yellowColor];
    self.changeColor1 = [UIColor greenColor];
    self.changeColor2 = [UIColor redColor];
    
    self.colorArray = [[NSArray alloc] initWithObjects:
                       changeColor,
                       changeColor1,
                       changeColor2,
                       nil];
                       
}

//
// *** DID-RECEIVE-MEMORY-WARNING ***
//
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
//    NSString *myString = @"Defined text";
//     [myString length];
//     [myString uppercaseString];
  
//    NSArray *predictionArray = [[NSArray alloc] initWithObjects:
//                       @"Array is 1st",
//                       @"Array is 2nd",
//                       nil];
    
//    NSUInteger indexNum = arc4random_uniform(self.predictionArray.count);
//    NSUInteger indexCol = arc4random_uniform(self.colorArray.count);
    
//    self.predictionLabel.textColor = [self.colorArray objectAtIndex:indexCol];
//    self.predictionLabel.text = [self.predictionArray objectAtIndex:indexNum];

    self.predictionLabel.alpha = 0.0;
    [self makePrediction];
}

//
// *** MAKE-PREDICTION ***
//
// create method named make prediction by ecapsulating the code called by several methods
// custom made methods for text, color and fade-ins
//
- (void) makePrediction {
//  debug this:  NSUInteger indexNum = arc4random_uniform(999);

    NSUInteger indexNum = arc4random_uniform(self.predictionArray.count);

    self.predictionLabel.text = [self.predictionArray objectAtIndex:indexNum];
    
    // Added:CJ
    // This is how we call the color assignment from the UIColor array created in viewDidLoad
    // First line creates an NSUInteger called indexCol and assigns a random number based on the count of elements in colorArray
    // Second line changes the predictionLabel.textColor by assigning it the UIColor object from the Array at the random index
    //
    NSUInteger indexCol = arc4random_uniform(self.colorArray.count);
    self.predictionLabel.textColor = [self.colorArray objectAtIndex:indexCol];
    
    // add code here to run the animation
    //
    [self.blueView startAnimating];
    
    // and this code to gradually fade-in the text
    [UIView animateWithDuration:4.5 animations:^{
        self.predictionLabel.alpha = 1.0;
    }];
}


- (BOOL) canBecomeFirstResponder {
    return YES;
}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
//    NSLog(@"motion began");
//  self.predictionLabel.text = @"";
    self.predictionLabel.text = nil;
    self.predictionLabel.alpha = 0.0;
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
//    NSLog(@"motion ended");
        
//        NSUInteger indexNum = arc4random_uniform(self.predictionArray.count);
//        self.predictionLabel.text = [self.predictionArray objectAtIndex:indexNum];
        [self makePrediction];
    }
}

- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"motion cancelled");
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//  self.predictionLabel.text = @"";
    self.predictionLabel.text = nil;
    self.predictionLabel.alpha = 0.0;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSUInteger indexNum = arc4random_uniform(self.predictionArray.count);
//    self.predictionLabel.text = [self.predictionArray objectAtIndex:indexNum];
    [self makePrediction];
}

@end
