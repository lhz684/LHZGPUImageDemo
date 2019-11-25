//
//  ViewController.m
//  LHZGPUImageDemo
//
//  Created by mac on 2019/11/22.
//  Copyright © 2019 mac. All rights reserved.
//

#import "ViewController.h"


#define Ktitle  @"title"
#define Kitmes @"items"
#define Kvc @"vc"
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *table;

@property (nonatomic,strong) NSArray * array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.table.delegate = self;
    self.table.dataSource = self;
    
    self.array = @[
        @{Ktitle:@"", Kitmes:@[
                                @{Ktitle:@"GPUImage处理图片", Kvc:@"GPUPhotoVC"}
                            ]
          
        }
    ];
}

#pragma mark - tableView datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary * dic = self.array[section];
    NSArray * array = dic[Kitmes];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * indentifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:indentifier];
    }
    NSDictionary * dic = self.array[indexPath.section];
    NSArray * array = dic[Kitmes];
    NSDictionary * item = array[indexPath.row];
    cell.textLabel.text = item[Ktitle];
    return cell;
}

#pragma mark - tableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary * dic = self.array[indexPath.section];
    NSArray * array = dic[Kitmes];
    NSDictionary * item = array[indexPath.row];
    NSString * vcStr = item[Kvc];
    
    UIViewController * vc = [[NSClassFromString(vcStr) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - push





@end
