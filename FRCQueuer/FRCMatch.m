//
//  FRCMatch.m
//  FRCQueuer
//
//  Created by Eric Stern on 4/4/13.
//  Copyright (c) 2013 Eric Stern. All rights reserved.
//

#import "FRCMatch.h"

@interface FRCMatch	()
@property (nonatomic, strong) NSMutableArray *teamNumbers;
@property (nonatomic, strong) NSMutableArray *teamPresences;
@end

@implementation FRCMatch

-(id) init {
	self = [super init];
	_teamNumbers = [[NSMutableArray alloc] initWithCapacity:numPositions];
	_teamPresences = [[NSMutableArray alloc] initWithCapacity:numPositions];
	for (int i = 0; i < numPositions; i++) {
		[_teamNumbers setObject:@0 atIndexedSubscript:i];
		[_teamPresences setObject:@0 atIndexedSubscript:i];
	}
	return self;
}

-(BOOL) isTeamPresentAtPosition:(teamPosition) position {
	return [[self.teamPresences objectAtIndex:position] boolValue];
}

-(NSUInteger) teamNumberAtPosition:(teamPosition) position {
	return [[self.teamNumbers objectAtIndex:position] intValue];
}

-(void) setTeamNumber:(NSUInteger)number atPosition:(teamPosition)position {
	[self.teamNumbers setObject:[NSNumber numberWithInt:number] atIndexedSubscript:position];
}

-(void) setTeamPresence:(BOOL)present atPosition:(teamPosition)position {
	[self.teamPresences setObject:[NSNumber numberWithBool:present] atIndexedSubscript:position];
}

+(UIColor *)redColor {
	return [[UIColor alloc] initWithRed:1.0 green:0.4 blue:0.4 alpha:1.0];
}
+(UIColor *)blueColor {
	return [[UIColor alloc] initWithRed:0.4 green:0.4 blue:1.0 alpha:1.0];

}

@end
