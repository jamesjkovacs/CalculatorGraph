//
//  GraphViewController.h
//  CalculatorGraph
//
//  Created by James Kovacs on 6/13/11.
//  Copyright 2011 AmanoMcGann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphView.h"


@interface GraphViewController : UIViewController {
    GraphView *graphView;
    
}

- (IBAction) zoomIn;
- (IBAction) zoomOut;

@property (retain) IBOutlet GraphView *graphView;


@end
