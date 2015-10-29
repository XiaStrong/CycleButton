//
//  ViewController.m
//  CycleButton
//
//  Created by Xia_Q on 15/7/5.
//  Copyright (c) 2015年 Xia_Q. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *array;
    int _addIndex;//按钮添加叠加
    int _addRow;//添加按钮行叠加
    
    CGFloat _addWidth;//
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    _addIndex=0;
    _addRow=1;
    _addWidth=0;
    
    
    NSArray *arr=@[@"你们",@"你们",@"你们你们你们你们你们你们",@"你们",@"你们",@"你我他",@"没事的沃尔玛",@"真的好麻烦啊",@"无聊",@"你们你们你们你们你们你们",@"你们",@"你们"];
    _btnScrollView=[[UIScrollView alloc]init];
    CGRect rect=[UIScreen mainScreen].bounds;
    
    _btnScrollView.frame=CGRectMake(0, 0, rect.size.width, rect.size.height);
    _btnScrollView.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:_btnScrollView];
    
    
    
    
    for (int i=0; i<arr.count; i++) {
        [self scrollViewAddSubView:arr[i]];
    }

    
}

-(void)scrollViewAddSubView:(NSString*)selectValue
{
    CGFloat leftLength=10.0;
    CGFloat topLength=5.0;
    _addIndex++;
    CGSize size=self.btnScrollView.frame.size;
    CGFloat scrollViewWidth=size.width-leftLength*2;
    CGFloat scrollViewHeight=size.height;
    CGFloat selectValueWidth=selectValue.length*20.0+8.0;//btn的长度
    CGFloat selectValueHeight=40.0;  //选择的高度
    CGFloat selectValueMarginLeft=0;  //空白距离
    _addWidth+=selectValueWidth+(_addIndex-1)*leftLength;
    if(_addWidth>scrollViewWidth)
    {
        selectValueMarginLeft=10.0;
        _addWidth=selectValueWidth;
        _addRow++;
    }
    else
    {
        selectValueMarginLeft=_addWidth-selectValueWidth+leftLength;
    }
    if(_addRow>1)
    {
        topLength=_addRow*5.0+(_addRow-1)*selectValueHeight;
    }
    else
    {
        topLength=5.0;
    }
    
    
    _addWidth-=(_addIndex-1)*leftLength;
    UIButton*addBtn=[[UIButton alloc]initWithFrame:CGRectMake(selectValueMarginLeft, topLength, selectValueWidth, selectValueHeight)];
    [addBtn setTitleColor:[UIColor redColor ] forState:UIControlStateNormal];
    [addBtn setTitle:selectValue forState:UIControlStateNormal];
    addBtn.backgroundColor=[UIColor greenColor];
    [addBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
    addBtn.tag=_addIndex-1;
    [addBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.btnScrollView addSubview:addBtn];
    
    
    if(_addRow*5.0+(_addRow+1)*selectValueHeight>scrollViewHeight)
    {
        self.btnScrollView.contentSize=CGSizeMake(scrollViewWidth+leftLength*2, _addRow*5.0+(_addRow)*selectValueHeight+5);
    }
}

-(void)buttonClicked:(UIButton *)btn
{
    NSLog(@"tag=%ld",btn.tag);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
