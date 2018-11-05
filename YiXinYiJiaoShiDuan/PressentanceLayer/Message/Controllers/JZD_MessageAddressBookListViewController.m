//
//  JZD_MessageAddressBookListViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_MessageAddressBookListView.h"
#import "JZD_MessageAddressBookListViewController.h"

@interface JZD_MessageAddressBookListViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchImageLeft;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet JZD_MessageAddressBookListView *messageAddressBookListView;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@end

@implementation JZD_MessageAddressBookListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchTextField.delegate = self;
    self.searchButton.selected = NO;
    self.searchImageLeft.constant = DEVICE_WIDTH / 375.f *130;
    [self.searchView layerCornerRadius:@8 borderWidth:@1 borderColor:HEX_COLOR(0x999999)];
    
    @weakify(self);
    self.messageAddressBookListView.addressBookDidSelectAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);//JZD_MessageGroupChatViewController
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Message" controllerId:@"JZD_MessageGroupChatViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    
    self.searchTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:nil];
    // Do any additional setup after loading the view.
}

- (void)textFieldChange:(id)sender {
    NSLog(@"搜索内容");
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

- (IBAction)searchButtonClick:(id)sender {
    if (!self.searchButton.selected) {
        [self.searchTextField becomeFirstResponder];
        self.searchImageLeft.constant = 12;
        
        self.searchButton.selected = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
