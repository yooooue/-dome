//
//  ViewController.m
//  小dome
//
//  Created by 韩倩云 on 16/9/18.
//  Copyright © 2016年 HanQianyun. All rights reserved.
//

#import "ViewController.h"
#import "CommonCrypto/CommonDigest.h"
#import "NetManager.h"
#import "Header.h"

@interface ViewController ()
{
    UITextField * usernameTextF;
    UITextField * passWTextF;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    usernameTextF = [[UITextField alloc] initWithFrame:CGRectMake(50, 150, self.view.frame.size.width-100, 50)];
    usernameTextF.placeholder = @"请输入用户名";
    usernameTextF.borderStyle = UITextBorderStyleNone;
    usernameTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:usernameTextF];
    
    passWTextF = [[UITextField alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(usernameTextF.frame)+50, self.view.frame.size.width-100, 50)];
    passWTextF.placeholder = @"请输入密码";
    passWTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
    passWTextF.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:passWTextF];
    
    UIButton * loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, CGRectGetMaxY(passWTextF.frame)+50, self.view.frame.size.width-200, 50)];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.backgroundColor = [UIColor redColor];
    [loginBtn addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
}

- (void)getData {
    [NetManager shareManager]requestURL:LOGIN andSuccessBlock:<#^(id data)successB#> andFailedBlock:<#^(NSError *error)failedB#>
}
- (void)onClick {
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [usernameTextF resignFirstResponder];
    [passWTextF resignFirstResponder];
 
}

#pragma mark-----SHA1加密-----
- (NSString*) sha1:(NSString *) input
{
//    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
//    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    NSData * data = [input dataUsingEncoding:NSUTF8StringEncoding];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);

    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
