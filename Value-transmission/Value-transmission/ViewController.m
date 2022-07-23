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
    
    // 属性传值
    nextVC.str = @"属性传值";
    [self presentViewController:nextVC animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self.view addSubview:self.label];
    [self.view addSubview:self.btn];
}

@end

