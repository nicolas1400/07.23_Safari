//
//  ViewController.m
//  Safari
//
//  Created by Nicolas Semenas on 23/07/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.homepageURLString = @"http://www.mobilemakers.co";
    [self loadURLString:self.homepageURLString];
}


-(void) loadURLString: (NSString *)urlString {

    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *URLRequest = [NSURLRequest requestWithURL:url];
    [self.myWebView loadRequest:URLRequest];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{

    NSLog (@"Loading...");}

-(void)webViewDidFinishLoad:(UIWebView *)webView{

    NSLog (@"Loaded!");
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSString *URLString = textField.text;
    [self loadURLString:URLString];
    [textField resignFirstResponder];
    return YES;
}

- (void) webView: (UIWebView *)webView didFailLoadWithError:(NSError *)error{
    UIAlertView *alertView = [[UIAlertView alloc]init];
    alertView.title = @"ERROR";
    alertView.message = error.localizedDescription;
    alertView.delegate = self;
    [alertView addButtonWithTitle:@"That stinks!"];
    [alertView addButtonWithTitle:@"Go Home!"];

    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1 ) {
        
        
        [self loadURLString:self.homepageURLString];

        
    }
    
}




@end
