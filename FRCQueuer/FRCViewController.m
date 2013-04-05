//
//  FRCViewController.m
//  FRCQueuer
//
//  Created by Eric Stern on 4/4/13.
//  Copyright (c) 2013 Eric Stern. All rights reserved.
//

#import "FRCViewController.h"

#import "FRCEvent.h"
#import "FRCMatch.h"
#import <QuartzCore/QuartzCore.h>

@interface FRCViewController ()

@property (nonatomic, strong) FRCEvent *currentEvent;
@property (nonatomic, strong) NSString *playing;

@property (nonatomic, strong) FRCMatch *currentMatch;
@property (nonatomic, strong) FRCMatch *nextMatch;

@property (nonatomic, strong) NSArray *currentLabels;
@property (nonatomic, strong) NSArray *nextLabels;

@end

@implementation FRCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	self.currentEvent = [[FRCEvent alloc] init];

	FRCMatch *matchOne = [[FRCMatch alloc] init];
	[matchOne setTeamNumber:114 atPosition:teamPositionRed1];
	[matchOne setTeamNumber:115 atPosition:teamPositionRed2];
	[matchOne setTeamNumber:1072 atPosition:teamPositionRed3];
	[matchOne setTeamNumber:4544 atPosition:teamPositionBlue1];
	[matchOne setTeamNumber:668 atPosition:teamPositionBlue2];
	[matchOne setTeamNumber:971 atPosition:teamPositionBlue3];

	FRCMatch *matchTwo = [[FRCMatch alloc] init];
	[matchTwo setTeamNumber:4543 atPosition:teamPositionRed1];
	[matchTwo setTeamNumber:1967 atPosition:teamPositionRed2];
	[matchTwo setTeamNumber:751 atPosition:teamPositionRed3];
	[matchTwo setTeamNumber:846 atPosition:teamPositionBlue1];
	[matchTwo setTeamNumber:192 atPosition:teamPositionBlue2];
	[matchTwo setTeamNumber:4255 atPosition:teamPositionBlue3];

	[self.currentEvent.matches setObject:matchOne forKey:@"1"];
	[self.currentEvent.matches setObject:matchTwo forKey:@"2"];

	[self updateLabels];

	self.playing = @"1";

	self.playingLabel.text = self.playing;
	self.currentMatch = [self.currentEvent.matches objectForKey:self.playing];
	self.nextMatch = [self.currentEvent.matches objectForKey:[NSString stringWithFormat:@"%d", self.playing.intValue + 1]];

	for (int i = 0; i < numPositions; i++) {
		((UILabel *)[self.currentLabels objectAtIndex:i]).text = [NSString stringWithFormat:@"%d", [self.currentMatch teamNumberAtPosition:i]];
		((UILabel *)[self.nextLabels objectAtIndex:i]).text = [NSString stringWithFormat:@"%d", [self.nextMatch teamNumberAtPosition:i]];
	}
	// [self.red1next  setTitle:[NSString stringWithFormat:@"%d", [self.nextMatch teamNumberAtPosition:teamPositionRed1]] forState:UIControlStateNormal];
	// [self.red2next  setTitle:[NSString stringWithFormat:@"%d", [self.nextMatch teamNumberAtPosition:teamPositionRed2]] forState:UIControlStateNormal];
	// [self.red3next  setTitle:[NSString stringWithFormat:@"%d", [self.nextMatch teamNumberAtPosition:teamPositionRed3]] forState:UIControlStateNormal];
	// [self.blue1next setTitle:[NSString stringWithFormat:@"%d", [self.nextMatch teamNumberAtPosition:teamPositionBlue1]] forState:UIControlStateNormal];
	// [self.blue2next setTitle:[NSString stringWithFormat:@"%d", [self.nextMatch teamNumberAtPosition:teamPositionBlue2]] forState:UIControlStateNormal];
	// [self.blue3next setTitle:[NSString stringWithFormat:@"%d", [self.nextMatch teamNumberAtPosition:teamPositionBlue3]] forState:UIControlStateNormal];
}

- (void)updateLabels {
	self.currentLabels =
	@[self.red1current
	, self.red2current
	, self.red3current
	, self.blue1current
	, self.blue2current
	, self.blue3current
	];
	self.nextLabels =
	@[self.red1next
	, self.red2next
	, self.red3next
	, self.blue1next
	, self.blue2next
	, self.blue3next
	];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)queuedTeamPressed:(UIButton *)sender {
	teamPosition pos;
	if (sender == self.red1btn) {
		pos = teamPositionRed1;
	}
	else if (sender == self.red2btn) {
		pos = teamPositionRed2;
	}
	else if (sender == self.red3btn) {
		pos = teamPositionRed3;
	}
	else if (sender == self.blue1btn) {
		pos = teamPositionBlue1;
	}
	else if (sender == self.blue2btn) {
		pos = teamPositionBlue2;
	}
	else if (sender == self.blue3btn) {
		pos = teamPositionBlue3;
	}
	else {
		NSLog(@"%@", sender);
		pos = 0;
	}

	BOOL selected = ![self.nextMatch isTeamPresentAtPosition:pos];
	NSLog(@"%d", selected);
	[self.nextMatch setTeamPresence:selected atPosition:pos];
	UILabel *label = [self.nextLabels objectAtIndex:pos];
	if (selected) {
		label.backgroundColor = [UIColor greenColor];
	}
	else if (pos >= teamPositionRed1 && pos <= teamPositionRed3) {
		label.backgroundColor = [FRCMatch redColor];
	}
	else if (pos >= teamPositionBlue1 && pos <= teamPositionBlue3) {
		label.backgroundColor = [FRCMatch blueColor];
	}
	else {
		NSLog(@"%d", pos);
	}

}
@end
