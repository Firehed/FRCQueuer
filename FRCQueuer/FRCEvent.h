//
//  FRCEvent.h
//  FRCQueuer
//
//  Created by Eric Stern on 4/4/13.
//  Copyright (c) 2013 Eric Stern. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRCMatch.h"

@interface FRCEvent : NSObject

@property (nonatomic, strong) NSMutableDictionary *matches;
@property (nonatomic, strong) NSNumber *playingMatch;

-(FRCMatch *)matchAtNumber:(NSString *)number;
-(void)addMatch:(FRCMatch *)match;
@end
