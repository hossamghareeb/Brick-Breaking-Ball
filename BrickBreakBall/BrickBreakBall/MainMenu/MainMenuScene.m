//
//  MainMenuScene.m
//  BrickBreakBall
//
//  Created by Hossam on 3/21/13.
//
//

#import "MainMenuScene.h"

@implementation MainMenuScene


+(CCScene *)scene
{
    CCScene *scene = [CCScene node];
    
    MainMenuLayer *layer = [MainMenuLayer node];
    
    [scene addChild:layer];
    
    return scene;
}

@end
