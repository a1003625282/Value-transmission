//
//  NextViewController.m
//  Value-transmission
//
//  Created by ZJH on 2022/7/23.
//

#import "NextViewController.h"
#import "DefaultInstance.h"
@interface NextViewController ()
@property(strong,nonatomic) UITextField *textField;
@property(strong,nonatomic) UIButton *btn;
@end

@implementation NextViewController

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
        _textField.textColor = [UIColor blackColor];
        _textField.borderStyle = UITextBorderStyleLine;
        

    }
    return _textField;
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 200, 40)];
        _btn.backgroundColor = [UIColor redColor];
        [_btn setTitle:@"跳转回页面1" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn.titleLabel.font = [UIFont systemFontOfSize:20];
        
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

// 页面2的点击事件 -- 回到页面1
- (void)btnClick {
    
    // 代理传值 -- 反向传值
    // 通过id指针进行代理传值
    [self.delegate passValue:self.textField.text];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.btn];
}



@end
