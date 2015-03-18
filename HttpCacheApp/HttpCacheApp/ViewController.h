//
//  ViewController.h
//  HttpCacheApp
//
//  Created by Thales Figuredo Pereira on 3/18/15.
//  Copyright (c) 2015 Thales Figuredo Pereira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

- (IBAction)atualizarAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

