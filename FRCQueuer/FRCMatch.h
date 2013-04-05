//
//  FRCMatch.h
//  FRCQueuer
//
//  Created by Eric Stern on 4/4/13.
//  Copyright (c) 2013 Eric Stern. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRCMatch : NSObject

typedef enum {
	teamPositionRed1,
	teamPositionRed2,
	teamPositionRed3,
	teamPositionBlue1,
	teamPositionBlue2,
	teamPositionBlue3,
	numPositions
} teamPosition;

@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) NSString *time;

-(BOOL) isTeamPresentAtPosition:(teamPosition) position;
-(NSUInteger) teamNumberAtPosition:(teamPosition) position;
-(void) setTeamNumber:(NSUInteger) number atPosition:(teamPosition) position;
-(void) setTeamPresence:(BOOL)present atPosition:(teamPosition)position;
-(UIColor *) colorForPosition:(teamPosition) position;

+(UIColor *) redColor;
+(UIColor *) blueColor;

@end
