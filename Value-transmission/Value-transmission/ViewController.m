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
    
    // NSUserDefaults传值 -- 正向传值
    [[NSUserDefaults standardUserDefaults] setObject:@"NSUserDefaults传值" forKey:@"NSUserDefaults"];
    // 写数据之后要同步一下，他才能真正的写入我们的文件中
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.navigationController pushViewController:nextVC animated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    //NSUserDefaults传值 -- 接收页面2的反向传值
    self.label.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"NSUserDefaults-re"];
    
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.label];
    [self.view addSubview:self.btn];
}

@end

