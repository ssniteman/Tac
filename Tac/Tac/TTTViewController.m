//
//  TTTViewController.m
//  Tac
//
//  Created by Shane Sniteman on 7/29/14.
//  Copyright (c) 2014 Shane Sniteman. All rights reserved.
//

#import "TTTViewController.h"
#import "TTTTouchSpot.h"

@interface TTTViewController ()

@end

@implementation TTTViewController
{
    NSMutableArray * spots;
    
    BOOL player1Turn;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        spots = [@[] mutableCopy];
        
        player1Turn = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    int spotWH = 80;
    int padding = 20;

    int gridWidth = (spotWH * 3) + (padding * 2);
    
    float spacingW = (SCREEEN_WIDTH - gridWidth) / 2;
    
    float spacingH = (SCREEN_HEIGHT - gridWidth) / 2;
    
    for (int row = 0; row < 3; row++)
    {
        
        // run for each row
        
        for (int col = 0; col < 3; col++)
        {
            // run for each column in each row
            
            int x = (spotWH + padding) * col + spacingW;
            int y = (spotWH + padding) * row + spacingH;
            
            UIView * spot = [[UIView alloc] initWithFrame:CGRectMake(x, y, spotWH, spotWH)];
            
            spot.backgroundColor = [UIColor lightGrayColor];
            
            [self.view addSubview:spot];
            
            [spots addObject:spot];
            
        }
    }
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"tickletickle");
    
    UITouch * touch = [touches allObjects][0];
    int spotWH = 80;
    for (UIView * spot in spots)
    {
        CGPoint location = [touch locationInView:spot];
        
        // x >= 0
        // y >= 0
        
        // x <= spotWH
        // y <= spotWH
        
        if (location.x >= 0 && location.y >= 0)
            if (location.x <= spotWH && location.y <= spotWH) {
                
                if ([spot.backgroundColor isEqual:[UIColor lightGrayColor]]) {
                    
                    // spot touched
                    NSLog(@"%@",spot);
                    
                    UIColor * color = (player1Turn) ? [UIColor cyanColor] :
                    [UIColor magentaColor];
                    
                    spot.backgroundColor = color;
                    
                    player1Turn = !player1Turn;
                    
                    [self checkForWinner];
                }
                
            }
            
        
//        NSLog(@"x : %f y : %f",location.x,location.y);
    }
    
    
}

- (void)checkForWinner
{
    // if 0, 1, 2 == same color... then color wins
    
    UIView * spot0 = spots[0];
    UIView * spot1 = spots[1];
    UIView * spot2 = spots[2];
    
    if ([spot0.backgroundColor isEqual:spot1.backgroundColor] && [spot1.backgroundColor isEqual:spot2.backgroundColor])
    {
        if ([spot0.backgroundColor isEqual:[UIColor cyanColor]])
        {
            // then player 1 wins
            
            NSLog(@"player 1 wins");
    
        } else {
            // player 2 wins
            NSLog(@"player 2 wins");
            
            // make this work for every case
            // 012
            // 345
            // 678
            // 036
            // 147
            // 258
            // 048
            // 246
            
            // might result in another method
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
