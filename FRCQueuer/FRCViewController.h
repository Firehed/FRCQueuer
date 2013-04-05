//
//  FRCViewController.h
//  FRCQueuer
//
//  Created by Eric Stern on 4/4/13.
//  Copyright (c) 2013 Eric Stern. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FRCViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *playingLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentTime;
@property (weak, nonatomic) IBOutlet UILabel *nextTime;

@property (weak, nonatomic) IBOutlet UILabel *red1current;
@property (weak, nonatomic) IBOutlet UILabel *red2current;
@property (weak, nonatomic) IBOutlet UILabel *red3current;

@property (weak, nonatomic) IBOutlet UILabel *blue1current;
@property (weak, nonatomic) IBOutlet UILabel *blue2current;
@property (weak, nonatomic) IBOutlet UILabel *blue3current;

@property (weak, nonatomic) IBOutlet UILabel *red1next;
@property (weak, nonatomic) IBOutlet UILabel *red2next;
@property (weak, nonatomic) IBOutlet UILabel *red3next;

@property (weak, nonatomic) IBOutlet UILabel *blue1next;
@property (weak, nonatomic) IBOutlet UILabel *blue2next;
@property (weak, nonatomic) IBOutlet UILabel *blue3next;

@property (weak, nonatomic) IBOutlet UIButton *red1btn;
@property (weak, nonatomic) IBOutlet UIButton *red2btn;
@property (weak, nonatomic) IBOutlet UIButton *red3btn;

@property (weak, nonatomic) IBOutlet UIButton *blue1btn;
@property (weak, nonatomic) IBOutlet UIButton *blue2btn;
@property (weak, nonatomic) IBOutlet UIButton *blue3btn;

- (IBAction)nextMatchButtonPressed;


@end
