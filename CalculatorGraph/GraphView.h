//
//  GraphView.h
//  CalculatorGraph
//
//  Created by James Kovacs on 6/13/11.
//  Copyright 2011 AmanoMcGann. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GraphView;

@protocol GraphViewDelegate
- (float) scaleForGraph:(GraphView *)requester;
- (double)calculateYForGraphGivenX:(double)xValue;
- (bool) useLines:(GraphView *)requester;
- (bool) usePixels:(GraphView *)requester;
@end

@interface GraphView : UIView {
    id <GraphViewDelegate> delegate;
}

@property (assign) id <GraphViewDelegate> delegate;

@end
