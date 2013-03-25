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

    
    DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
        return [[super allocWithZone:NULL] init];
    });
    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        gamePlayHeader = [[super allocWithZone:NULL] init];
//    });
    
    return gamePlayHeader;
}

-(id)init
{
    if ((self  = [super init])) {
        [self resetGame];
    }
    
    return self;
}

-(void)loseLife
{
    self.currentLives--;
}
-(void)addToScore:(int)newScore
{
    self.currentScore += newScore;
}
-(void)resetGame
{
    self.currentLevel = 1;
    self.currentLives = 3;
    self.currentScore = 0;
}


-(id)readPlistWithFileName:(NSString *)fileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSPropertyListFormat format;
    id plist = [NSPropertyListSerialization propertyListFromData:data
                                     mutabilityOption:NSPropertyListImmutable
                                               format:&format
                                     errorDescription:nil];
    
    return plist;
    
}

-(NSDictionary *)getDictionaryFromPlist:(NSString *)fileName
{
    return (NSDictionary *)[self readPlistWithFileName:fileName];
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
