//
//  ViewController.m
//  Value-transmission
//
//  Created by ZJH on 2022/7/23.
//

#import "ViewController.h"

@interface ViewController ()

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
    
    // 通知传值 -- 添加监听 -- 等待页面2的传值
    // selector:我们接收到通知之后的处理
    // name:通知的名字，要监听哪一个通知
    // object:监听来自于哪里的通知,填nil的话表示广播群发的,任何一个发送方只要发送了一个叫notify通知我们都可以收到
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notHandle:) name:@"notify" object:nil];
    
    [self.navigationController pushViewController:nextVC animated:YES];
    
}

// 接受到通知之后的处理 -- 参数1：通知
- (void)notHandle:(NSNotification *)not{
    self.label.text = not.userInfo[@"not"];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.label];
    [self.view addSubview:self.btn];
}

@end

