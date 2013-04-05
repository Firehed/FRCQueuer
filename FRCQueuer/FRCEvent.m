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
	return self;
}

@end
