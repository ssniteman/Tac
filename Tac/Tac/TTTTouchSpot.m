//
//  TTTTouchSpot.m
//  Tac
//
//  Created by Shane Sniteman on 7/29/14.
//  Copyright (c) 2014 Shane Sniteman. All rights reserved.
//

#import "TTTTouchSpot.h"

@implementation TTTTouchSpot

{
    UIImageView * imageView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // add a uiimageview
        
        imageView  = [[UIImageView alloc] initWithFrame:self.bounds];
        
        [self addSubview:imageView];
        
    }
    return self;
}


// player setter method will change image

-(void)setPlayer:(int)player
{
    _player = player;
    
     // designating icons to players//
    
    switch (player) {
        case 0:
            imageView.image = [UIImage imageNamed:@"spot"];
            break;
        case 1:
            imageView.image = [UIImage imageNamed:@"x"];
            break;
        case 2:
            imageView.image = [UIImage imageNamed:@"circle"];
            break;
    }
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
