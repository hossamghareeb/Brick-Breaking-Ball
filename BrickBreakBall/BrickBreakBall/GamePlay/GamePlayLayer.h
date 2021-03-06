//
//  GamePlayLayer.h
//  BrickBreakBall
//
//  Created by Hossam on 3/21/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PhysicsSprite.h"
#import "BRContactListener.h"
#import "SimpleAudioEngine.h"
#import "HUDLayer.h"


@interface GamePlayLayer : CCLayer <CCTargetedTouchDelegate>{
    
    CGSize size;
    BOOL isGameOver;
    
    b2World *world;
    b2Body *wallBody;
    b2Body *paddleBody;
    b2Fixture *paddleFixture;
    
    b2MouseJoint *mouseJoint;
    
    HUDLayer *hud;
    
    b2Fixture *bottomGutter;
    
    CCSpriteBatchNode *bricksSheet;
    
    BRContactListener *contactListener;
    
    PhysicsSprite *playerPaddle;
    
    GamePlayHeader *gameInfo;
    NSDictionary *patternsDef;
    float upperBarHeight;
    
    
    ccTime paddleTime;
    BOOL isPaddleSizeChanged;
    BOOL shouldStartMultiball;
}

@end
