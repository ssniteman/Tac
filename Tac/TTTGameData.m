//
//  TTTGameData.m
//  Tac
//
//  Created by Shane Sniteman on 8/28/14.
//  Copyright (c) 2014 Shane Sniteman. All rights reserved.
//

#import "TTTGameData.h"
#import "TTTTouchSpot.h"

@implementation TTTGameData
{
    NSArray * possibilities;
}

+ (TTTGameData *)mainData;

{
    
    // GCD: Dispatch Once
    
    // Calling once and never using again
    
    static dispatch_once_t onceToken;
    
    static TTTGameData * singleton = nil;
    
    dispatch_once(&onceToken, ^{
        
        singleton = [[TTTGameData alloc] init];
        
    });
    
    return singleton;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.spots = [@[] mutableCopy];
        self.player1Turn = YES;
        
        possibilities = @[
                         @[@0,@1,@2],
                         @[@3,@4,@5],
                         @[@6,@7,@8],
                         @[@0,@3,@6],
                         @[@1,@4,@7],
                         @[@2,@5,@8],
                         @[@0,@4,@8],
                         @[@2,@4,@6]
                         ];
        
    }
    return self;
}

- (void)setPlayer1Turn:(BOOL)player1Turn
{
    _player1Turn = player1Turn;
    
    if(player1Turn ==NO)
    {
        // run robot - below method
        
        //set a spot.player - below method
        
        //change a player1turn - below method
        
        //check for winner
        
        [self robotChooseSpot];
    }
}

- (void)robotChooseSpot
{
    for (TTTTouchSpot * spot in self.spots)
    {
        if (spot.player == 0)
        {
            spot.player = 2;
            
            self.player1Turn = !self.player1Turn;
            [self checkForWinner];
            
            return;
        }
    }
}


- (BOOL)findWinningSpot
{
    for (NSArray * possibility in possibilities)
        
    {
        TTTTouchSpot * spot0 = self.spots[[possibility[0]intValue]];
        TTTTouchSpot * spot1 = self.spots[[possibility[1] intValue]];
        TTTTouchSpot * spot2 = self.spots[[possibility[2] intValue]];
        
        if (spot0.player == 2 && spot1.player == 2 && spot2.player == 0)
        {
            spot2.player = 2;
            return YES;
        }
        
        if (spot0.player == 2 && spot2.player == 2 && spot1.player == 0)
        {
            spot1.player = 2;
            return YES;
        }
        
        if (spot2.player == 2 && spot1.player == 2 && spot0.player == 0)
        {
            spot0.player = 2;
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)findBlockingSpot
{
    for (NSArray * possibility in possibilities)
        
    {
        TTTTouchSpot * spot0 = self.spots[[possibility[0]intValue]];
        TTTTouchSpot * spot1 = self.spots[[possibility[1] intValue]];
        TTTTouchSpot * spot2 = self.spots[[possibility[2] intValue]];
    }
}

- (BOOL)findRandomSpot
{
    for (NSArray * possibility in possibilities)
        
    {
        TTTTouchSpot * spot0 = self.spots[[possibility[0]intValue]];
        TTTTouchSpot * spot1 = self.spots[[possibility[1] intValue]];
        TTTTouchSpot * spot2 = self.spots[[possibility[2] intValue]];
    }
}

-(void)checkForWinner
{

    BOOL winner = NO;
    
    for (NSArray * possibility in possibilities)
        
    {
        TTTTouchSpot * spot0 = self.spots[[possibility[0]intValue]];
        TTTTouchSpot * spot1 = self.spots[[possibility[1] intValue]];
        TTTTouchSpot * spot2 = self.spots[[possibility[2] intValue]];
        
        if(spot0.player ==spot1.player && spot1.player == spot2.player && spot0 != 0) {
            winner = YES;
            }
            
        for(TTTTouchSpot * spot in self.spots)
            {

                if (spot.player==0) {
                    
                    emptySpots++;
                            
                    }
                    
                if (emptySpots ==0 && !winner){
                        
                }
            }
    }
}



@end
