//
//  TTTTouchSpot.m
//  Tac
//
//  Created by Shane Sniteman on 7/29/14.
//  Copyright (c) 2014 Shane Sniteman. All rights reserved.
//

#import "TTTTouchSpot.h"

@implementation TTTTouchSpot

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // add a uiimageview
    }
    return self;
}


// player setter method will change image

-(void)setPlayer:(int)player
{
    _player = player;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
