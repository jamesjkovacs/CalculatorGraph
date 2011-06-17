//
//  GraphViewController.m
//  CalculatorGraph
//
//  Created by James Kovacs on 6/13/11.
//  Copyright 2011 AmanoMcGann. All rights reserved.
//

#import "GraphViewController.h"
#import "CalculatorBrain.h"


@implementation GraphViewController

@synthesize graphView, graphScale, graphExpression, graphUseLines, graphUsePixels;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (bool)useLines:(GraphView *)requester
{
    return self.graphUseLines;
}

- (bool)usePixels:(GraphView *)requester
{
    return self.graphUsePixels;
}

- (double)calculateYForGraphGivenX:(double)xValue
{
    NSDictionary *varValues = [NSDictionary dictionaryWithObjectsAndKeys:
                               [NSNumber numberWithDouble: xValue], @"%x",nil];

    double yValue = [CalculatorBrain evaluateExpression:self.graphExpression usingVariableValues:varValues];
    
    return yValue;
}

- (float)scaleForGraph:(GraphView *)requester
{
    float scale = 0;
    if(self.graphView == requester)
    {
        scale = self.graphScale;
    }
    return scale;
}

- (void)updateUI
{
    [self.graphView setNeedsDisplay];
}

- (void)setGraphScale:(float)newGraphScale
{
    graphScale = newGraphScale;
    [self updateUI]; 
}

- (void)setGraphUseLines:(bool)newUseLines
{
    graphUseLines = newUseLines;
    [self updateUI]; 
}

- (void)setGraphUsePixels:(bool)newUsePixels
{
    graphUsePixels = newUsePixels;
    [self updateUI];
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (IBAction) zoomIn
{
    self.graphScale += 1;
}

- (IBAction) zoomOut
{
    self.graphScale -= 1;
}

- (IBAction) useLines
{
    self.graphUseLines = YES; 
}

- (IBAction) usePoints
{
    self.graphUseLines = NO; 
}

- (IBAction) usePixelsSwitch:(UISwitch *)sender
{
    if(sender.on)
        self.graphUsePixels = YES;
    else
        self.graphUsePixels = NO;
        
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.graphUseLines = NO;
    self.graphScale = 14;
    self.graphView.delegate = self;
    [self updateUI];
    // Do any additional setup after loading the view from its nib.
}

- (void) releaseOutlets
{
    self.graphView = nil;
}

- (void) dealloc
{
    [self releaseOutlets];
    [self.graphExpression release];
    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self releaseOutlets];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}

@end
