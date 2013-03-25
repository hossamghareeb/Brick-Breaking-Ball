//
//  HUDLayer.h
//  BrickBreakBall
//
//  Created by Hossam on 3/25/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class GamePlayHeader;

@interface HUDLayer : CCSprite
{
    GamePlayHeader *gameInfo;
    CCLabelTTF *scoreTitle;
    CCLabelTTF *livesTitle;
    CCLabelTTF *scoreDisply;
    CCLabelTTF *livesDisplay;
    
    CCSpriteBatchNode *bricksBatch;
}

-(void)addScore:(int)score;
-(void)loseLife;

@end
