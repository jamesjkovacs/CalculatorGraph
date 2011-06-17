//
//  GraphViewController.h
//  CalculatorGraph
//
//  Created by James Kovacs on 6/13/11.
//  Copyright 2011 AmanoMcGann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphView.h"


@interface GraphViewController : UIViewController <GraphViewDelegate>
{
    GraphView *graphView;
    float graphScale;
    NSMutableArray *graphExpression;
    bool graphUseLines;
    bool graphUsePixels;
}

- (IBAction) zoomIn;
- (IBAction) zoomOut;
- (IBAction) useLines;
- (IBAction) usePoints;
- (IBAction) usePixelsSwitch: (UISwitch *)sender;

@property (retain) IBOutlet GraphView *graphView;
@property float graphScale;
@property bool graphUsePixels;
@property bool graphUseLines;
@property (assign) NSMutableArray *graphExpression;


@end
