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

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawCircleAtPoint:(CGPoint)p withRadius:(CGFloat)radius inContext:(CGContextRef)context
{
    UIGraphicsPushContext(context);
	CGContextBeginPath(context);
	CGContextAddArc(context, p.x, p.y, radius, 0, 2*M_PI, YES);
	CGContextStrokePath(context);
	UIGraphicsPopContext();
}

- (void)drawLineAtStartingPoint:(CGPoint)start withEndingPoint:(CGPoint)end inContext:(CGContextRef)context
{
	UIGraphicsPushContext(context);
	CGContextBeginPath(context);
    CGContextMoveToPoint(context, start.x, start.y);
    CGContextAddLineToPoint(context, end.x, end.y);
	CGContextStrokePath(context);
	UIGraphicsPopContext();
}

- (void)drawRect:(CGRect)rect
{
    CGPoint displayPoint;
    displayPoint.x = self.bounds.origin.x + self.bounds.size.width/2;
    displayPoint.y = self.bounds.origin.y + self.bounds.size.height/2;
    float gScale = [self.delegate scaleForGraph:self];
    [AxesDrawer drawAxesInRect:rect originAtPoint:displayPoint scale:gScale];
    if([self.delegate usePixels:self])
        self.contentScaleFactor = 1;
    else
        self.contentScaleFactor = 2;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, .5);
    [[UIColor blueColor] set];

//	CGContextBeginPath(context);
    CGPoint hashStartPoint;
    CGPoint hashEndPoint;
    double yCoordinate, xCoordinate;
    bool firstTime = YES;
//    for (int offset = -xCoordinate; offset <= xCoordinate; offset++){
    for (int i = 0; i <= self.bounds.size.width; i++){
        xCoordinate = (i/gScale) - (self.bounds.size.width/gScale/2);
        yCoordinate = [self.delegate calculateYForGraphGivenX:xCoordinate];
            
        if (firstTime) {
            hashStartPoint.x = i;
            hashStartPoint.y = abs(yCoordinate * gScale);
            firstTime = NO;
        }
        hashEndPoint.x = i;
        hashEndPoint.y = ((self.bounds.size.height/gScale/2) + (-1 * yCoordinate)) * gScale;
        if([self.delegate useLines:self])
            [self drawLineAtStartingPoint:hashStartPoint withEndingPoint:hashEndPoint inContext:context];
        else    
            [self drawCircleAtPoint:hashEndPoint withRadius:.2 inContext:context];
        NSLog(@"x=%G y=%G xPoint=%G yPoint=%G",xCoordinate, yCoordinate, hashEndPoint.x, hashEndPoint.y);

        hashStartPoint.x = hashEndPoint.x;
        hashStartPoint.y = hashEndPoint.y;
    }
        
//    CGContextStrokePath(context);

}


- (void)dealloc
{
    [super dealloc];
}

@end
