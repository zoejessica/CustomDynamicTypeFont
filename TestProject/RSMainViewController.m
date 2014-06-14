//
//  RSMainViewController.m
//  CustomFontTester
//
//  Created by Venkat Rao on 11/29/13.
//  Copyright (c) 2013 Rao Studios. All rights reserved.
//

#import "RSMainViewController.h"
#import "UIFont+ZJCustom.h"

@interface RSMainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelBody;
@property (weak, nonatomic) IBOutlet UILabel *labelCaption1;
@property (weak, nonatomic) IBOutlet UILabel *labelCaption2;
@property (weak, nonatomic) IBOutlet UILabel *labelFootnote;
@property (weak, nonatomic) IBOutlet UILabel *labelHeadline;
@property (weak, nonatomic) IBOutlet UILabel *labelSubhead;

@end

@implementation RSMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self sizeChanged:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(sizeChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
}

- (void)sizeChanged:(id)sender {
    self.labelBody.font = [UIFont customFontForTextStyle:UIFontTextStyleBody];
    self.labelCaption1.font = [UIFont customFontForTextStyle:UIFontTextStyleBody];
    self.labelCaption2.font = [UIFont customFontForTextStyle:UIFontTextStyleCaption2];
    self.labelFootnote.font = [UIFont customFontForTextStyle:UIFontTextStyleCaption2];
    self.labelHeadline.font = [UIFont customFontForTextStyle:UIFontTextStyleHeadline];
    self.labelSubhead.font = [UIFont customFontForTextStyle:UIFontTextStyleHeadline];

    [self.labelBody invalidateIntrinsicContentSize];
    [self.labelCaption1 invalidateIntrinsicContentSize];
    [self.labelCaption2 invalidateIntrinsicContentSize];
    [self.labelFootnote invalidateIntrinsicContentSize];
    [self.labelHeadline invalidateIntrinsicContentSize];
    [self.labelSubhead invalidateIntrinsicContentSize];

}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
