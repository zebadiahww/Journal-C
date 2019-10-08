//
//  ZWWDetailVC.m
//  JournalC
//
//  Created by Zebadiah Watson on 10/7/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import "ZWWDetailVC.h"
#import "ZWWEntryController.h"
#import <UIKit/UIKit.h>
#import "ZWWEntry.h"

@interface ZWWDetailVC ()
//outlets
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;


@end

@implementation ZWWDetailVC

-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    [textField resignFirstResponder];
    return true;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//action
- (IBAction)clearButtonTapped:(id)sender {
}


@end


