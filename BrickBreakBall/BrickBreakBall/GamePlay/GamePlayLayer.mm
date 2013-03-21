//
//  GamePlayLayer.m
//  BrickBreakBall
//
//  Created by Hossam on 3/21/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GamePlayLayer.h"


@implementation GamePlayLayer

-(id)init
{
    if ((self = [super init])) {
        
        size = [[CCDirector sharedDirector] winSize];
        upperBarHeight = 60.0f;
        //load sprite sheet
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"bricksheet.plist"];
        bricksSheet = [CCSpriteBatchNode batchNodeWithFile:@"bricksheet.png" capacity:100];
        [self addChild:bricksSheet z:1];
        
        //add the background image
        CCSprite *backGround = [CCSprite spriteWithSpriteFrameName:@"brick_bg.png"];
        backGround.position = ccp(size.width / 2,
                                  size.height / 2);
        [self addChild:backGround z:-2];
        
        
        [self setUpWorld];
        [self buildEdges];
        
        [self schedule:@selector(update:)];

    
    }
    return self;
}

-(void)onEnterTransitionDidFinish
{
    [self addNewBall];
}

-(void)update:(ccTime)dt
{
    world->Step(dt, 10, 10);
    
    for (b2Body *b = world->GetBodyList() ; b; ) {
        
    }
}

-(void)setUpWorld
{
    b2Vec2 gravity;
    gravity.Set(0, 0);
    world = new b2World(gravity);
    
    world->SetAllowSleeping(true);
    world->SetContinuousPhysics(true);
    
    //creating the contact listener here
}


-(void)buildEdges
{
    //define and creating the wall body
    b2BodyDef wallBodyDef;
    wallBodyDef.position.Set(0, 0);
    wallBody = world->CreateBody(&wallBodyDef);
    
    //create 4 corners

    b2Vec2 bl(0.0f, 0.0f); //bottom_left
    b2Vec2 br(size.width / PTM_RATIO, 0.0f); //bottom_right  //devide on PTM_RATIO to convert from cocos2d location to box2d location
    
    b2Vec2 ul(0.0f, (size.height - upperBarHeight) / PTM_RATIO); //upper_left
    b2Vec2 ur(br.x, ul.y); //upper_right
    
    b2EdgeShape bottomEdge, leftEdge, upperEdge, rightEdge;  //gamePlay edges
    
    bottomEdge.Set(bl, br);
    leftEdge.Set(bl, ul);
    upperEdge.Set(ul, ur);
    rightEdge.Set(br, ur);
    
    wallBody->CreateFixture(&leftEdge, 0);
    wallBody->CreateFixture(&upperEdge, 0);
    wallBody->CreateFixture(&rightEdge, 0);
    
    bottomGutter = wallBody->CreateFixture(&bottomEdge, 0); //we have the b2fixture to be used in collison with ball (lose)
    
}

-(void)addNewBall
{
    //give kick down and right
    [self createBallAtPosition:ccp(200, 150) andInitialImpulse:b2Vec2(0.2, -1.5)];
}

-(void)createBallAtPosition:(CGPoint)position andInitialImpulse:(b2Vec2)impulse
{
    PhysicsSprite *ball = [PhysicsSprite spriteWithSpriteFrameName:@"ball.png"];
    ball.position = position;
    ball.tag = BALL;
    [bricksSheet addChild:ball z:50];
    
    //create ball body (body created with position and type)
    b2BodyDef ballBodyDef;
    ballBodyDef.position.Set(position.x / PTM_RATIO, position.y / PTM_RATIO);
    ballBodyDef.type = b2_dynamicBody;
    ballBodyDef.userData = ball;
    
    b2Body *ballBody = world->CreateBody(&ballBodyDef);
    [ball setPhysicsBody:ballBody];
    
    b2CircleShape circleShape;
    circleShape.m_radius = 7.0 / PTM_RATIO;
    
    b2FixtureDef ballFixtureDef;
    ballFixtureDef.shape = &circleShape;
    ballFixtureDef.density = 1.0f;
    ballFixtureDef.friction = 0.0f;
    ballFixtureDef.restitution = 1.0f; //perfect bouncy
    
    ballBody->CreateFixture(&ballFixtureDef);
    //add an impulse (kick) to the ball to move
    ballBody->ApplyLinearImpulse(impulse, ballBody->GetPosition());
    
}




@end
