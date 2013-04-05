//
//  FRCViewController.h
//  FRCQueuer
//
//  Created by Eric Stern on 4/4/13.
//  Copyright (c) 2013 Eric Stern. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FRCEvent;

@interface FRCViewController : UIViewController

@property (nonatomic, strong) FRCEvent *currentEvent;

+(FRCEvent *) SVR;

@property (weak, nonatomic) IBOutlet UILabel *playingLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentTime;
@property (weak, nonatomic) IBOutlet UILabel *nextTime;

@property (weak, nonatomic) IBOutlet UILabel *red1current;
@property (weak, nonatomic) IBOutlet UILabel *red2current;
@property (weak, nonatomic) IBOutlet UILabel *red3current;

@property (weak, nonatomic) IBOutlet UILabel *blue1current;
@property (weak, nonatomic) IBOutlet UILabel *blue2current;
@property (weak, nonatomic) IBOutlet UILabel *blue3current;

@property (weak, nonatomic) IBOutlet UIButton *red1btn;
@property (weak, nonatomic) IBOutlet UIButton *red2btn;
@property (weak, nonatomic) IBOutlet UIButton *red3btn;

@property (weak, nonatomic) IBOutlet UIButton *blue1btn;
@property (weak, nonatomic) IBOutlet UIButton *blue2btn;
@property (weak, nonatomic) IBOutlet UIButton *blue3btn;

- (IBAction)prevMatchButtonPressed;

- (IBAction)nextMatchButtonPressed;


@end
