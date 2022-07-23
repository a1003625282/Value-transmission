//
//  ViewController.m
//  Value-transmission
//
//  Created by ZJH on 2022/7/23.
//

#import "ViewController.h"

@interface ViewController ()<passValueDelegate> //遵守协议

@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIButton *btn;

@end


@implementation ViewController


// 通过懒加载创建Button
-(UILabel *)label{
    if(_label == nil){
        _label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
        _label.backgroundColor = [UIColor blackColor];
        _label.textColor = [UIColor whiteColor];
        _label.font = [UIFont systemFontOfSize:20];
    }
    
    return _label;
}

-(UIButton *)btn{
    if(_btn == nil){
        _btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 200, 40)];
        _btn.backgroundColor = [UIColor redColor];
        [_btn setTitle:@"跳转至页面2" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btn;
}

// btn点击事件
-(void)btnClick{
    NextViewController *nextVC = [[NextViewController alloc]init];
    
    // 设置代理关系
    // 两方如果通讯，要先将代理的关系给设置好
    nextVC.delegate = self;
    
    [self.navigationController pushViewController:nextVC animated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}

// 代理传值 -- 实现协议方法 -- 接收来自页面2的值
// 页面2的值就在参数传递的str
- (void)passValue:(NSString *)str {
    self.label.text = str;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.label];
    [self.view addSubview:self.btn];
}

@end

