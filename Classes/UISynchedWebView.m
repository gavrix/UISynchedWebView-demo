//
//  TableWebView.m
//  TableWebView
//
//  Created by Sergey Gavrilyuk on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UISynchedWebView.h"


@implementation UISynchedWebView

-(id) init
{
	if((self = [super init]) != nil)
	{
		self.delegate = self;
	}
	return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
	if((self = [super initWithCoder:aDecoder]) != nil)
	{
		self.delegate = self;
	}
	return self;
}

-(id) initWithFrame:(CGRect)frame
{
	if((self = [super initWithFrame:frame]) != nil)
	{
		self.delegate = self;
	}
	return self;
}

-(void) setDelegate:(id <UIWebViewDelegate>) delegate;
{
	[super setDelegate:self];
	if(delegate != self)
		anotherDelegate = delegate;
}


-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	[self performSelector:@selector(stopRunLoop) withObject:nil afterDelay:.01];
	
	if([anotherDelegate respondsToSelector:@selector(webView:didFailLoadWithError:)])
		[anotherDelegate webView:webView didFailLoadWithError:error];
}

-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	if([anotherDelegate respondsToSelector:@selector(webView:shouldStartLoadWithRequest:navigationType:)])
		return [anotherDelegate webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
	return YES;
}

-(void) webViewDidFinishLoad:(UIWebView *)webView
{
	[self performSelector:@selector(stopRunLoop) withObject:nil afterDelay:.01];
	if([anotherDelegate respondsToSelector:@selector(webViewDidFinishLoad:)])
		[anotherDelegate webViewDidFinishLoad:webView];
}

-(void) stopRunLoop
{
	CFRunLoopRef runLoop = [[NSRunLoop currentRunLoop] getCFRunLoop];
	CFRunLoopStop(runLoop);
	
}

-(void) webViewDidStartLoad:(UIWebView *)webView
{
	if([anotherDelegate respondsToSelector:@selector(webViewDidStartLoad:)])
		[anotherDelegate webViewDidStartLoad:webView];
}


-(void) loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL
{
	[super loadHTMLString:string baseURL:baseURL];
	
	CFRunLoopRunInMode((CFStringRef)NSDefaultRunLoopMode, 1, NO);
}

@end
