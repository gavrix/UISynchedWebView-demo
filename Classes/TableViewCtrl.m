//
//  TableViewCtrl.m
//  TableWebView
//
//  Created by Sergey Gavrilyuk on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TableViewCtrl.h"
#import "UISynchedWebView.h"

@implementation TableViewCtrl


#pragma mark -
#pragma mark View lifecycle


-(id) initWithCoder:(NSCoder *)aDecoder
{
	if((self = [super initWithCoder:aDecoder]) != nil)
	{
		lock = [[NSLock alloc] init];
	}
	
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 20;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		UIWebView* webView = [[UISynchedWebView alloc] initWithFrame:
							  CGRectMake(10, 10, cell.bounds.size.width - 20, cell.bounds.size.height - 20)];
		webView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
		webView.tag = 1001;
		webView.userInteractionEnabled = NO;
		webView.backgroundColor = [UIColor clearColor];
		webView.opaque = NO;

		
		[cell addSubview:webView];
		[webView release];
    }
    
	UIWebView* webView = (UIWebView*)[cell viewWithTag:1001];
	webView.delegate = self;
	
	NSLog(@"current mode: %@", [[NSRunLoop currentRunLoop] currentMode]);
	
	[webView loadHTMLString: [NSString stringWithFormat:@"<head><body style=”background-color:transparent”><head><body>\
							  <i>this is very</i><b>very</b> <span style = \"font-size:120%%\">interesting text</span><br>row number: <b>%d</b></body>", indexPath.row]
					baseURL:nil];
	
	
	return cell;
}




-(void) webViewDidFinishLoad:(UIWebView *)webView
{
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 130;
}


#pragma mark -
#pragma mark Table view delegate


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc 
{
	[lock release];
	
	
    [super dealloc];
}


@end

