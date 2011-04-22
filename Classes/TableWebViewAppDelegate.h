//
//  TableWebViewAppDelegate.h
//  TableWebView
//
//  Created by Sergey Gavrilyuk on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCtrl.h"

@interface TableWebViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TableViewCtrl* tableViewCtrl;

@end

