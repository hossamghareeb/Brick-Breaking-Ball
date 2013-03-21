//
//  GameConstatns.h
//  BrickBreakBall
//
//  Created by Hossam on 3/21/13.
//
//

#ifndef BrickBreakBall_GameConstatns_h
#define BrickBreakBall_GameConstatns_h


#define PTM_RATIO 32


typedef enum {
    
    BALL = 1 << 0,
    PADDLE = 1 << 1,
    BRICK = 1 << 2,
    WALL = 1 << 3,
    POWER_UP_EXPAND = 1 << 4,
    POWER_UP_SHRINK = 1 << 5,
    POWER_UP_MULTI_BALL = 1 << 6

}OBJECT_TYPE;

#endif
