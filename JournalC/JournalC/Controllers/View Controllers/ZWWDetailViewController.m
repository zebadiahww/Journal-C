//
//  ZWWDetailVC.m
//  JournalC
//
//  Created by Zebadiah Watson on 10/7/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import "ZWWDetailViewController.h"
#import "ZWWEntryController.h"
#import <UIKit/UIKit.h>
#import "ZWWEntry.h"

@interface ZWWDetailViewController ()
//outlets
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;


@end

@implementation ZWWDetailViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    [self updateViews];
}
- (void)updateViews
{
    if (!self.entry) return;
    
    self.titleTextField.text = self.entry.title;
    self.bodyTextView.text = self.entry.bodyText;
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    [textField resignFirstResponder];
    return true;
}

//Actions
- (IBAction)clearButtonTapped:(id)sender {
    _titleTextField.text = @"";
    _bodyTextView.text = @"";
    
}
- (IBAction)saveButtonTapped:(id)sender {
    NSString *title = _titleTextField.text;
    NSString *bodyText = _bodyTextView.text;
    if ([self entry])
    {
        
        [[ZWWEntryController sharedController] updateEntryWithEntry:_entry title:title bodyText:bodyText];
//        [ZWWEntryController.sharedController] updateEntryWithEntry: entry title: title bodyText:bodyText]
    } else {
        [[ZWWEntryController sharedController] addEntryWithTitle:self.titleTextField.text bodyText:self.titleTextField.text];
    }
    [[self navigationController] popViewControllerAnimated:true];
}


- (void)setEntry:(ZWWEntry *)entry
{
    if (entry != _entry) {
        _entry = entry;
        [self updateViews];
    }
}

@end


