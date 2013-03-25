//
//  GamePlayHeader.m
//  BrickBreakBall
//
//  Created by Hossam on 3/25/13.
//
//

#import "GamePlayHeader.h"

static GamePlayHeader *gamePlayHeader = nil;


@implementation GamePlayHeader

@synthesize playFieldLayer, currentLevel, currentLives, currentScore;

+(id)sharedHeader
{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gamePlayHeader = [[super allocWithZone:NULL] init];
    });
    
    return gamePlayHeader;
}
-(void)loseLife
{
    
}
-(void)addToScore:(int)newScore
{
    
}
-(void)resetGame
{
    
}

- (id)retain {
    return self;
}
- (unsigned)retainCount {
    return NSUIntegerMax;
}
-(oneway void)release {
    //do nothing - the singleton is not allowed to release
}
- (id)autorelease {
    return self;
}
@end
