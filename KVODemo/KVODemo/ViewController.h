//
//  ViewController.h
//  KVODemo
//
//  Created by chen on 14-11-26.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lab1;

@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;

@property (nonatomic,strong)DataModel *model;


@end

