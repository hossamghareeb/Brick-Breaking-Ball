//
//  GamePlayScene.m
//  BrickBreakBall
//
//  Created by Hossam on 3/21/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GamePlayScene.h"


@implementation GamePlayScene


+(CCScene *)scene
{
    return [[[GamePlayScene alloc] init] autorelease];
}

-(id)init
{
    
    if (self = [super init]) {
        GamePlayLayer *layer = [GamePlayLayer node];
        [self addChild:layer];
        
        
    }
    
    return self;
}

@end
