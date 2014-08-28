//
//  TTTGameData.h
//  Tac
//
//  Created by Shane Sniteman on 8/28/14.
//  Copyright (c) 2014 Shane Sniteman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTTGameData : NSObject

+ (TTTGameData *)mainData;

- (void)checkForWinner;

@property (nonatomic) NSMutableArray * spots;

@property (nonatomic) BOOL player1Turn;

@end
