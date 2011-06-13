//
//  GraphView.m
//  CalculatorGraph
//
//  Created by James Kovacs on 6/13/11.
//  Copyright 2011 AmanoMcGann. All rights reserved.
//

#import "GraphView.h"
#import "AxesDrawer.h"


@implementation GraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGPoint displayPoint;
    displayPoint.x = self.bounds.origin.x + self.bounds.size.width/2;
    displayPoint.y = self.bounds.origin.y + self.bounds.size.height/2;
    CGFloat gScale = 14;
    [AxesDrawer drawAxesInRect:rect originAtPoint:displayPoint scale:gScale];
}


- (void)dealloc
{
    [super dealloc];
}

@end
