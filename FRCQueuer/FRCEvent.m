//
//  FRCEvent.m
//  FRCQueuer
//
//  Created by Eric Stern on 4/4/13.
//  Copyright (c) 2013 Eric Stern. All rights reserved.
//

#import "FRCEvent.h"

@implementation FRCEvent

-(id) init {
	self = [super init];
	_matches = [[NSMutableDictionary alloc] init];
	_id = 0;
	_code = @"";
	_name = @"";
	_matchOrder = [[NSMutableArray alloc] init];
	return self;
}

-(FRCMatch *)matchAtNumber:(NSString *)number {
	return [self.matches objectForKey:number];
}
-(void)addMatch:(FRCMatch *)match {
	[self.matches setObject:match forKey:match.number];
}
@end
