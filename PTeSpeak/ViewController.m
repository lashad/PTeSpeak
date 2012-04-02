//
//  ViewController.m
//  PTeSpeak
//
//  Created by Lasha Dolidze on 4/2/12.
//  Copyright (c) 2012 Picktek LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textView;
@synthesize button;

- (void)speakDidStart:(PTeSpeak *)espeak
{
    [button setTitle:@"Stop" forState:UIControlStateNormal];
}

- (void)speakDidEnd:(PTeSpeak *)espeak
{
    [button setTitle:@"Start" forState:UIControlStateNormal];
}

- (void)speakWithError:(PTeSpeak *)espeak error:(OSStatus)error
{
    [button setTitle:@"Start" forState:UIControlStateNormal];
}

- (IBAction)speak:(id)sender
{
    
    if([[PTeSpeak sharedPTeSpeak] isSpeak]) {
        [[PTeSpeak sharedPTeSpeak] stop];
        return ;
    }
    
    if([[self.textView text] length] <= 0) {
        return ;
    }
    
    
    [[PTeSpeak sharedPTeSpeak] speak:[self.textView text] ];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.textView becomeFirstResponder];
    
    
    [[PTeSpeak sharedPTeSpeak] setDelegate:self];
    [[PTeSpeak sharedPTeSpeak] setupWithVoice:@"ka" volume:100 rate:150 pitch:40];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
