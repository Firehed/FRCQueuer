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

- (void)updateLabels {
    self.playingLabel.text = self.playing;
	self.currentMatch = [self.currentEvent.matches objectForKey:self.playing];
	self.nextMatch = [self.currentEvent.matches objectForKey:[NSString stringWithFormat:@"%d", self.playing.intValue + 1]];
    
	for (int i = 0; i < numPositions; i++) {
		((UILabel *)[self.currentLabels objectAtIndex:i]).text = [NSString stringWithFormat:@"%d", [self.currentMatch teamNumberAtPosition:i]];
		((UILabel *)[self.nextLabels objectAtIndex:i]).text = [NSString stringWithFormat:@"%d", [self.nextMatch teamNumberAtPosition:i]];
	}
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	self.currentEvent = [FRCViewController SVR];

	[self initLabels];

	self.playing = @"1";

	[self updateLabels];
}

- (void)initLabels {
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


- (void)didReceiveMemoryWarning {
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

+ (FRCEvent *)SVR {
	NSString *jsonStr = @"[{\"time\":\"9:00 AM\",\"match\":1,\"red1\":254,\"red2\":295,\"red3\":2489,\"blue1\":1388,\"blue2\":3482,\"blue3\":649},{\"time\":\"9:06 AM\",\"match\":2,\"red1\":675,\"red2\":4171,\"red3\":2144,\"blue1\":2135,\"blue2\":2854,\"blue3\":670},{\"time\":\"9:12 AM\",\"match\":3,\"red1\":3598,\"red2\":115,\"red3\":3933,\"blue1\":668,\"blue2\":192,\"blue3\":3256},{\"time\":\"9:18 AM\",\"match\":4,\"red1\":1967,\"red2\":4543,\"red3\":233,\"blue1\":2473,\"blue2\":1072,\"blue3\":114},{\"time\":\"9:24 AM\",\"match\":5,\"red1\":2813,\"red2\":971,\"red3\":8,\"blue1\":2085,\"blue2\":2367,\"blue3\":581},{\"time\":\"9:30 AM\",\"match\":6,\"red1\":846,\"red2\":148,\"red3\":852,\"blue1\":2761,\"blue2\":3022,\"blue3\":4186},{\"time\":\"9:36 AM\",\"match\":7,\"red1\":118,\"red2\":1700,\"red3\":4765,\"blue1\":1662,\"blue2\":4047,\"blue3\":766},{\"time\":\"9:42 AM\",\"match\":8,\"red1\":256,\"red2\":973,\"red3\":692,\"blue1\":3995,\"blue2\":2643,\"blue3\":604},{\"time\":\"9:48 AM\",\"match\":9,\"red1\":3501,\"red2\":2915,\"red3\":1868,\"blue1\":840,\"blue2\":4255,\"blue3\":4159},{\"time\":\"9:54 AM\",\"match\":10,\"red1\":100,\"red2\":841,\"red3\":649,\"blue1\":751,\"blue2\":1351,\"blue3\":2035},{\"time\":\"10:00 AM\",\"match\":11,\"red1\":3256,\"red2\":670,\"red3\":2813,\"blue1\":4186,\"blue2\":852,\"blue3\":295},{\"time\":\"10:06 AM\",\"match\":12,\"red1\":2854,\"red2\":3933,\"red3\":1967,\"blue1\":971,\"blue2\":581,\"blue3\":118},{\"time\":\"10:12 AM\",\"match\":13,\"red1\":2135,\"red2\":668,\"red3\":604,\"blue1\":3022,\"blue2\":4543,\"blue3\":254},{\"time\":\"10:18 AM\",\"match\":14,\"red1\":766,\"red2\":675,\"red3\":115,\"blue1\":1868,\"blue2\":692,\"blue3\":846},{\"time\":\"10:24 AM\",\"match\":15,\"red1\":3598,\"red2\":840,\"red3\":973,\"blue1\":2761,\"blue2\":1700,\"blue3\":100},{\"time\":\"10:30 AM\",\"match\":16,\"red1\":3501,\"red2\":4765,\"red3\":192,\"blue1\":2367,\"blue2\":256,\"blue3\":2035},{\"time\":\"10:36 AM\",\"match\":17,\"red1\":4159,\"red2\":2144,\"red3\":1662,\"blue1\":114,\"blue2\":841,\"blue3\":2489},{\"time\":\"10:42 AM\",\"match\":18,\"red1\":2085,\"red2\":233,\"red3\":3482,\"blue1\":1351,\"blue2\":4047,\"blue3\":148},{\"time\":\"10:48 AM\",\"match\":19,\"red1\":751,\"red2\":1072,\"red3\":3995,\"blue1\":4255,\"blue2\":8,\"blue3\":2473},{\"time\":\"10:54 AM\",\"match\":20,\"red1\":2643,\"red2\":2915,\"red3\":971,\"blue1\":1388,\"blue2\":4171,\"blue3\":1700},{\"time\":\"11:00 AM\",\"match\":21,\"red1\":1868,\"red2\":649,\"red3\":581,\"blue1\":3022,\"blue2\":2135,\"blue3\":692},{\"time\":\"11:06 AM\",\"match\":22,\"red1\":2367,\"red2\":840,\"red3\":3933,\"blue1\":4543,\"blue2\":670,\"blue3\":114},{\"time\":\"11:12 AM\",\"match\":23,\"red1\":2144,\"red2\":233,\"red3\":766,\"blue1\":3598,\"blue2\":2085,\"blue3\":3501},{\"time\":\"11:18 AM\",\"match\":24,\"red1\":254,\"red2\":8,\"red3\":4186,\"blue1\":604,\"blue2\":118,\"blue3\":2761},{\"time\":\"11:24 AM\",\"match\":25,\"red1\":4255,\"red2\":3482,\"red3\":4047,\"blue1\":2035,\"blue2\":2854,\"blue3\":2643},{\"time\":\"11:30 AM\",\"match\":26,\"red1\":256,\"red2\":3995,\"red3\":100,\"blue1\":295,\"blue2\":2813,\"blue3\":115},{\"time\":\"1:00 PM\",\"match\":27,\"red1\":1351,\"red2\":2473,\"red3\":3256,\"blue1\":2915,\"blue2\":1388,\"blue3\":2489},{\"time\":\"1:07 PM\",\"match\":28,\"red1\":751,\"red2\":852,\"red3\":4171,\"blue1\":1967,\"blue2\":675,\"blue3\":4765},{\"time\":\"1:14 PM\",\"match\":29,\"red1\":148,\"red2\":1072,\"red3\":668,\"blue1\":846,\"blue2\":841,\"blue3\":4159},{\"time\":\"1:21 PM\",\"match\":30,\"red1\":192,\"red2\":1662,\"red3\":2854,\"blue1\":973,\"blue2\":3501,\"blue3\":8},{\"time\":\"1:28 PM\",\"match\":31,\"red1\":254,\"red2\":118,\"red3\":114,\"blue1\":692,\"blue2\":3598,\"blue3\":971},{\"time\":\"1:35 PM\",\"match\":32,\"red1\":581,\"red2\":604,\"red3\":4255,\"blue1\":649,\"blue2\":2144,\"blue3\":295},{\"time\":\"1:42 PM\",\"match\":33,\"red1\":670,\"red2\":1868,\"red3\":2035,\"blue1\":2085,\"blue2\":751,\"blue3\":3256},{\"time\":\"1:49 PM\",\"match\":34,\"red1\":2135,\"red2\":4159,\"red3\":2761,\"blue1\":3933,\"blue2\":233,\"blue3\":3995},{\"time\":\"1:56 PM\",\"match\":35,\"red1\":4047,\"red2\":256,\"red3\":1967,\"blue1\":2915,\"blue2\":100,\"blue3\":846},{\"time\":\"2:03 PM\",\"match\":36,\"red1\":852,\"red2\":2489,\"red3\":1700,\"blue1\":668,\"blue2\":4543,\"blue3\":4171},{\"time\":\"2:10 PM\",\"match\":37,\"red1\":973,\"red2\":1388,\"red3\":675,\"blue1\":3022,\"blue2\":148,\"blue3\":766},{\"time\":\"2:17 PM\",\"match\":38,\"red1\":840,\"red2\":2473,\"red3\":192,\"blue1\":2813,\"blue2\":841,\"blue3\":3482},{\"time\":\"2:24 PM\",\"match\":39,\"red1\":4186,\"red2\":1072,\"red3\":115,\"blue1\":1662,\"blue2\":1351,\"blue3\":2367},{\"time\":\"2:31 PM\",\"match\":40,\"red1\":2643,\"red2\":1868,\"red3\":254,\"blue1\":4765,\"blue2\":8,\"blue3\":100},{\"time\":\"2:38 PM\",\"match\":41,\"red1\":971,\"red2\":2135,\"red3\":3256,\"blue1\":670,\"blue2\":4047,\"blue3\":3501},{\"time\":\"2:45 PM\",\"match\":42,\"red1\":692,\"red2\":2085,\"red3\":675,\"blue1\":295,\"blue2\":4543,\"blue3\":2761},{\"time\":\"2:52 PM\",\"match\":43,\"red1\":766,\"red2\":973,\"red3\":841,\"blue1\":1967,\"blue2\":4255,\"blue3\":4171},{\"time\":\"2:59 PM\",\"match\":44,\"red1\":2035,\"red2\":1700,\"red3\":114,\"blue1\":1351,\"blue2\":3022,\"blue3\":3995},{\"time\":\"3:06 PM\",\"match\":45,\"red1\":4159,\"red2\":3482,\"red3\":118,\"blue1\":2144,\"blue2\":256,\"blue3\":852},{\"time\":\"3:13 PM\",\"match\":46,\"red1\":148,\"red2\":192,\"red3\":4186,\"blue1\":581,\"blue2\":751,\"blue3\":2643},{\"time\":\"3:20 PM\",\"match\":47,\"red1\":233,\"red2\":1388,\"red3\":2367,\"blue1\":2854,\"blue2\":668,\"blue3\":840},{\"time\":\"3:27 PM\",\"match\":48,\"red1\":4765,\"red2\":604,\"red3\":3598,\"blue1\":115,\"blue2\":2473,\"blue3\":846},{\"time\":\"3:34 PM\",\"match\":49,\"red1\":1072,\"red2\":3933,\"red3\":1662,\"blue1\":649,\"blue2\":2915,\"blue3\":2813},{\"time\":\"3:41 PM\",\"match\":50,\"red1\":2489,\"red2\":2761,\"red3\":971,\"blue1\":1868,\"blue2\":100,\"blue3\":766},{\"time\":\"3:48 PM\",\"match\":51,\"red1\":192,\"red2\":2085,\"red3\":4159,\"blue1\":2135,\"blue2\":675,\"blue3\":1700},{\"time\":\"3:55 PM\",\"match\":52,\"red1\":4255,\"red2\":668,\"red3\":256,\"blue1\":1351,\"blue2\":4543,\"blue3\":4186},{\"time\":\"4:02 PM\",\"match\":53,\"red1\":3022,\"red2\":846,\"red3\":1967,\"blue1\":840,\"blue2\":2144,\"blue3\":3256},{\"time\":\"4:09 PM\",\"match\":54,\"red1\":1662,\"red2\":692,\"red3\":2473,\"blue1\":2367,\"blue2\":148,\"blue3\":4171},{\"time\":\"4:15 PM\",\"match\":55,\"red1\":2035,\"red2\":581,\"red3\":3501,\"blue1\":852,\"blue2\":254,\"blue3\":2915},{\"time\":\"4:21 PM\",\"match\":56,\"red1\":841,\"red2\":4047,\"red3\":1388,\"blue1\":2813,\"blue2\":604,\"blue3\":3933},{\"time\":\"4:27 PM\",\"match\":57,\"red1\":2643,\"red2\":670,\"red3\":2489,\"blue1\":1072,\"blue2\":973,\"blue3\":118},{\"time\":\"4:33 PM\",\"match\":58,\"red1\":8,\"red2\":751,\"red3\":295,\"blue1\":114,\"blue2\":115,\"blue3\":233},{\"time\":\"4:39 PM\",\"match\":59,\"red1\":649,\"red2\":3995,\"red3\":4765,\"blue1\":3598,\"blue2\":3482,\"blue3\":2854},{\"time\":\"4:45 PM\",\"match\":60,\"red1\":4255,\"red2\":2915,\"red3\":2035,\"blue1\":2761,\"blue2\":2367,\"blue3\":675},{\"time\":\"4:51 PM\",\"match\":61,\"red1\":3933,\"red2\":148,\"red3\":1700,\"blue1\":254,\"blue2\":3501,\"blue3\":2144},{\"time\":\"4:57 PM\",\"match\":62,\"red1\":1351,\"red2\":604,\"red3\":692,\"blue1\":192,\"blue2\":1967,\"blue3\":670},{\"time\":\"5:03 PM\",\"match\":63,\"red1\":3022,\"red2\":118,\"red3\":4047,\"blue1\":751,\"blue2\":2473,\"blue3\":4159},{\"time\":\"5:09 PM\",\"match\":64,\"red1\":2085,\"red2\":841,\"red3\":1868,\"blue1\":1072,\"blue2\":3598,\"blue3\":256},{\"time\":\"5:15 PM\",\"match\":65,\"red1\":4543,\"red2\":2854,\"red3\":3256,\"blue1\":2813,\"blue2\":2643,\"blue3\":766},{\"time\":\"5:21 PM\",\"match\":66,\"red1\":852,\"red2\":3995,\"red3\":115,\"blue1\":649,\"blue2\":971,\"blue3\":840},{\"time\":\"5:27 PM\",\"match\":67,\"red1\":4765,\"red2\":295,\"red3\":1388,\"blue1\":4186,\"blue2\":2135,\"blue3\":973},{\"time\":\"5:33 PM\",\"match\":68,\"red1\":1662,\"red2\":100,\"red3\":114,\"blue1\":668,\"blue2\":581,\"blue3\":3482},{\"time\":\"5:39 PM\",\"match\":69,\"red1\":233,\"red2\":8,\"red3\":846,\"blue1\":4171,\"blue2\":2489,\"blue3\":3933},{\"time\":\"9:00 AM\",\"match\":70,\"red1\":2854,\"red2\":1700,\"red3\":2367,\"blue1\":604,\"blue2\":148,\"blue3\":751},{\"time\":\"9:06 AM\",\"match\":71,\"red1\":4255,\"red2\":766,\"red3\":670,\"blue1\":254,\"blue2\":4159,\"blue3\":115},{\"time\":\"9:12 AM\",\"match\":72,\"red1\":295,\"red2\":971,\"red3\":3022,\"blue1\":4765,\"blue2\":1072,\"blue3\":841},{\"time\":\"9:18 AM\",\"match\":73,\"red1\":4543,\"red2\":3995,\"red3\":2144,\"blue1\":1868,\"blue2\":4186,\"blue3\":1662},{\"time\":\"9:24 AM\",\"match\":74,\"red1\":1351,\"red2\":2915,\"red3\":2135,\"blue1\":8,\"blue2\":3598,\"blue3\":852},{\"time\":\"9:30 AM\",\"match\":75,\"red1\":846,\"red2\":118,\"red3\":2035,\"blue1\":233,\"blue2\":2813,\"blue3\":973},{\"time\":\"9:36 AM\",\"match\":76,\"red1\":840,\"red2\":256,\"red3\":581,\"blue1\":675,\"blue2\":2489,\"blue3\":2473},{\"time\":\"9:42 AM\",\"match\":77,\"red1\":1967,\"red2\":2761,\"red3\":668,\"blue1\":2643,\"blue2\":3482,\"blue3\":3501},{\"time\":\"9:48 AM\",\"match\":78,\"red1\":114,\"red2\":192,\"red3\":4171,\"blue1\":1388,\"blue2\":2085,\"blue3\":100},{\"time\":\"9:54 AM\",\"match\":79,\"red1\":649,\"red2\":692,\"red3\":8,\"blue1\":3256,\"blue2\":4047,\"blue3\":4159},{\"time\":\"10:00 AM\",\"match\":80,\"red1\":4765,\"red2\":2915,\"red3\":4543,\"blue1\":148,\"blue2\":670,\"blue3\":3995},{\"time\":\"10:06 AM\",\"match\":81,\"red1\":2813,\"red2\":3598,\"red3\":2489,\"blue1\":3022,\"blue2\":751,\"blue3\":4255},{\"time\":\"10:12 AM\",\"match\":82,\"red1\":973,\"red2\":2473,\"red3\":2035,\"blue1\":668,\"blue2\":2144,\"blue3\":971},{\"time\":\"10:18 AM\",\"match\":83,\"red1\":1351,\"red2\":295,\"red3\":4171,\"blue1\":1868,\"blue2\":118,\"blue3\":840},{\"time\":\"10:24 AM\",\"match\":84,\"red1\":2761,\"red2\":1072,\"red3\":4047,\"blue1\":192,\"blue2\":1388,\"blue3\":581},{\"time\":\"10:30 AM\",\"match\":85,\"red1\":649,\"red2\":846,\"red3\":2367,\"blue1\":256,\"blue2\":114,\"blue3\":2643},{\"time\":\"10:36 AM\",\"match\":86,\"red1\":2085,\"red2\":604,\"red3\":2854,\"blue1\":100,\"blue2\":852,\"blue3\":3933},{\"time\":\"10:42 AM\",\"match\":87,\"red1\":254,\"red2\":233,\"red3\":675,\"blue1\":1662,\"blue2\":1967,\"blue3\":3256},{\"time\":\"10:48 AM\",\"match\":88,\"red1\":3501,\"red2\":841,\"red3\":4186,\"blue1\":115,\"blue2\":692,\"blue3\":1700},{\"time\":\"10:54 AM\",\"match\":89,\"red1\":3482,\"red2\":766,\"red3\":840,\"blue1\":2135,\"blue2\":1072,\"blue3\":8},{\"time\":\"11:00 AM\",\"match\":90,\"red1\":1388,\"red2\":751,\"red3\":971,\"blue1\":846,\"blue2\":256,\"blue3\":4543},{\"time\":\"11:06 AM\",\"match\":91,\"red1\":2367,\"red2\":114,\"red3\":1868,\"blue1\":4047,\"blue2\":852,\"blue3\":973},{\"time\":\"11:12 AM\",\"match\":92,\"red1\":3022,\"red2\":2643,\"red3\":2473,\"blue1\":254,\"blue2\":1662,\"blue3\":2085},{\"time\":\"11:18 AM\",\"match\":93,\"red1\":3501,\"red2\":3256,\"red3\":675,\"blue1\":3995,\"blue2\":841,\"blue3\":118},{\"time\":\"11:24 AM\",\"match\":94,\"red1\":4159,\"red2\":3598,\"red3\":649,\"blue1\":2854,\"blue2\":4186,\"blue3\":4171},{\"time\":\"11:30 AM\",\"match\":95,\"red1\":581,\"red2\":670,\"red3\":100,\"blue1\":233,\"blue2\":4255,\"blue3\":1700},{\"time\":\"11:36 AM\",\"match\":96,\"red1\":1967,\"red2\":2135,\"red3\":115,\"blue1\":148,\"blue2\":2489,\"blue3\":2035},{\"time\":\"11:42 AM\",\"match\":97,\"red1\":668,\"red2\":766,\"red3\":2915,\"blue1\":295,\"blue2\":192,\"blue3\":604},{\"time\":\"11:48 AM\",\"match\":98,\"red1\":2144,\"red2\":1351,\"red3\":2813,\"blue1\":2761,\"blue2\":4765,\"blue3\":692},{\"time\":\"11:54 AM\",\"match\":99,\"red1\":3482,\"red2\":3022,\"red3\":2367,\"blue1\":3933,\"blue2\":1868,\"blue3\":4543}]";

	NSError *jsonUnserializationError;
	NSArray *rows = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&jsonUnserializationError];

	FRCEvent *event = [[FRCEvent alloc] init];
	for (NSDictionary *row in rows) {
		FRCMatch *match = [[FRCMatch alloc] init];
		[match setTeamNumber:[[row valueForKey:@"red1"] intValue] atPosition:teamPositionRed1];
		[match setTeamNumber:[[row valueForKey:@"red2"] intValue] atPosition:teamPositionRed2];
		[match setTeamNumber:[[row valueForKey:@"red3"] intValue] atPosition:teamPositionRed3];
		[match setTeamNumber:[[row valueForKey:@"blue1"] intValue] atPosition:teamPositionBlue1];
		[match setTeamNumber:[[row valueForKey:@"blue2"] intValue] atPosition:teamPositionBlue2];
		[match setTeamNumber:[[row valueForKey:@"blue3"] intValue] atPosition:teamPositionBlue3];
		match.number = [NSString stringWithFormat:@"%d", [[row valueForKey:@"match"] intValue]];
		match.time = [row valueForKey:@"time"];
		[event addMatch:match];
	}
	return event;


}

@end
