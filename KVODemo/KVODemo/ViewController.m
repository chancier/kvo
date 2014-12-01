//
//  ViewController.m
//  KVODemo
//
//  Created by chen on 14-11-26.
//  Copyright (c) 2014年 chen. All rights reserved.
//
/*
 kvo使用方法
 1. 注册，指定被观察者的属性，
 2. 实现回调方法
 3. 移除观察
 */

/*
 另附加入外部字体小知识
 1、导入外部字体，确保Bundle Resources里面添加成功；
 2、编辑”项目名-Info.plist”文件；
 3、打印出系统所有的字体名，或者finder查看找到字体的fontName
 */

#import "ViewController.h"

@interface ViewController ()
{
    NSInteger changeValue;
}
@end

@implementation ViewController

@synthesize model;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *familyNames = [UIFont familyNames];
    
    for( NSString *familyName in familyNames ){
        
        NSLog( @"Family: %s \n", [familyName UTF8String] );
        
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        
        for( NSString *fontName in fontNames ){
            
            NSLog( @"\tFont: %s \n", [fontName UTF8String] );
            
        }
    }
    
    UIFont *font1 = [UIFont fontWithName:@"Roboto-Light" size:20];
    UIFont *font2 = [UIFont fontWithName:@"Roboto-Regular" size:20];
    UIFont *font3 = [UIFont fontWithName:@"Roboto-Medium" size:20];
    
    self.lab1.font = font1;
    self.lab2.font = font2;
    self.lab3.font = font3;
    
    
    model = [[DataModel alloc] init];
    [model setValue:@"searph" forKey:@"dataName"];
    [model addObserver:self forKeyPath:@"dataName" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    [model addObserver:self forKeyPath:@"txtName" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
}

- (IBAction)changeValue:(id)sender
{
    changeValue++;
    [model setValue:[NSString stringWithFormat:@"dataName value%ld",changeValue] forKey:@"dataName"];
    model.txtName = [NSString stringWithFormat:@"txtName value%ld",changeValue];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"dataName"])
    {
        self.lab3.text = [model valueForKey:@"dataName"];
    }
    else if ([keyPath isEqualToString:@"txtName"])
    {
        self.lab2.text = model.txtName;
    }
}

-(void)dealloc
{
    [model removeObserver:self forKeyPath:@"dataName"];
    [model removeObserver:self forKeyPath:@"txtName"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
