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

@interface GamePlayLayer : CCLayer {
    
    CGSize size;
    
    b2World *world;
    b2Body *wallBody;
    b2Fixture *bottomGutter;
    
    CCSpriteBatchNode *bricksSheet;
    
    float upperBarHeight;
}

@end
