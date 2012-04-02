//
//  ViewController.h
//  PTeSpeak
//
//  Created by Lasha Dolidze on 4/2/12.
//  Copyright (c) 2012 Picktek LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTeSpeak.h"

@interface ViewController : UIViewController <PTeSpeakDelegate> {
    IBOutlet UITextView  *textView;
    IBOutlet UIButton    *button;
}

@property (nonatomic, retain) IBOutlet UITextView *textView;
@property (nonatomic, retain) IBOutlet UIButton    *button;

- (IBAction) speak:(id)sender;

@end
