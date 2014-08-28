//
//  TTTViewController.m
//  Tac
//
//  Created by Shane Sniteman on 7/29/14.
//  Copyright (c) 2014 Shane Sniteman. All rights reserved.
//

#import "TTTViewController.h"
#import "TTTTouchSpot.h"
#import "TTTGameData.h"

@interface TTTViewController () <UIAlertViewDelegate>

@end

@implementation TTTViewController
{
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
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
            
            TTTTouchSpot * spot = [[TTTTouchSpot alloc] initWithFrame:CGRectMake(x, y, spotWH, spotWH)];
            
            spot.backgroundColor = [UIColor lightGrayColor];
            
            spot.player = 0;
            
            [self.view addSubview:spot];
            
            [[TTTGameData mainData].spots addObject:spot];
            
        }
    }
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"tickletickle");
    
    UITouch * touch = [touches allObjects][0];
    int spotWH = 80;
    for (UIView * spot in [TTTGameData mainData].spots)
    {
        CGPoint location = [touch locationInView:spot];
        
        // x >= 0
        // y >= 0
        
        // x <= spotWH
        // y <= spotWH
        
        if (location.x >= 0 && location.y >= 0)
            if (location.x <= spotWH && location.y <= spotWH)
            {
                
                // change to spot.player
                
                if ([spot.backgroundColor isEqual:[UIColor lightGrayColor]]) {
                    
                    // spot touched
                    NSLog(@"%@",spot);
                    
                    UIColor * color = ([TTTGameData mainData].player1Turn) ? [UIColor cyanColor] :
                    [UIColor magentaColor];
                    
                    spot.backgroundColor = color;
                    
                    [TTTGameData mainData].player1Turn = ![TTTGameData mainData].player1Turn;
                    
                    [[TTTGameData mainData] checkForWinner];
                    
                }
                
                
                // uialertiew for winner or draw
                
            }
            
        
//        NSLog(@"x : %f y : %f",location.x,location.y);
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
