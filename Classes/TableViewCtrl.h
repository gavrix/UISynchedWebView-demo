//
//  TableViewCtrl.h
//  TableWebView
//
//  Created by Sergey Gavrilyuk on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TableViewCtrl : UITableViewController  <UIWebViewDelegate>
{

	NSLock* lock;
}

@end
