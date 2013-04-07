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
@property (nonatomic, strong) NSMutableArray *matchOrder;

@property (nonatomic) NSUInteger id;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *name;

-(FRCMatch *)matchAtNumber:(NSString *)number;
-(void)addMatch:(FRCMatch *)match;
@end
