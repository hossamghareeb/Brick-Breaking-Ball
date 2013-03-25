//
//  GamePlayHeader.h
//  BrickBreakBall
//
//  Created by Hossam on 3/25/13.
//
//

#import "cocos2d.h"
#import "GamePlayLayer.h"
#import <Foundation/Foundation.h>

@interface GamePlayHeader : CCNode



@property (nonatomic, assign)int currentLevel;
@property (nonatomic, assign)int currentScore;
@property (nonatomic, assign)int currentLives;

@property (nonatomic, retain)GamePlayLayer *playFieldLayer;


+(id)sharedHeader;
-(void)loseLife;
-(void)addToScore:(int)newScore;
-(void)resetGame;
@end
