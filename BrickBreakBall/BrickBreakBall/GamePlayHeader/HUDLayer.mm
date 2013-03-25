//
//  HUDLayer.m
//  BrickBreakBall
//
//  Created by Hossam on 3/25/13.
//
//

#import "HUDLayer.h"
#import "GamePlayHeader.h"
@implementation HUDLayer



-(id)init
{
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"bricksheet.plist"];
    
    bricksBatch = [CCSpriteBatchNode batchNodeWithFile:@"bricksheet.png"];
    
    if ((self  = [super initWithSpriteFrameName:@"legend_box.png"])) {
        
        gameInfo = [GamePlayHeader sharedHeader];
        
        //[self addChild:bricksBatch z:1];
        
        scoreTitle = [CCLabelTTF labelWithString:@"Score" fontName:@"Marker Felt" fontSize:25];
        scoreTitle.position = ccp(40, 2 * self.contentSize.height / 3 + 10);
        [self addChild:scoreTitle z:9];
        
        scoreDisply = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", gameInfo.currentScore] fontName:@"Marker Felt" fontSize:15];
        scoreDisply.position = ccp(40, self.contentSize.height / 3 + 10);
        [self addChild:scoreDisply z:10];
        
        livesTitle = [CCLabelTTF labelWithString:@"Lives" fontName:@"Marker Felt" fontSize:25];
        livesTitle.position = ccp(250, 2 * self.contentSize.height / 3 + 10);
        [self addChild:livesTitle];
        
        livesDisplay = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", gameInfo.currentLives] fontName:@"Marker Felt" fontSize:15];
        livesDisplay.position = ccp(250, self.contentSize.height / 3 + 10);
        [self addChild:livesDisplay];
        
    }
    
    return self;
}


-(void)addScore:(int)score
{
    [gameInfo addToScore:score];
    [scoreDisply setString:[NSString stringWithFormat:@"%d", gameInfo.currentScore]];
}
-(void)loseLife
{
    [gameInfo loseLife];
    [livesDisplay setString:[NSString stringWithFormat:@"%d", gameInfo.currentLives]];
}

@end
