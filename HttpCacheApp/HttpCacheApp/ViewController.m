//
//  ViewController.m
//  HttpCacheApp
//
//  Created by Thales Figuredo Pereira on 3/18/15.
//  Copyright (c) 2015 Thales Figuredo Pereira. All rights reserved.
//

#import "ViewController.h"

#import <AFNetworking.h>

#import <SDWebImage/UIImageView+WebCache.h>

#define BACKEND_URL @"http://localhost:9292/"

@interface ViewController ()
@property (nonatomic, strong) NSArray *personagens;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityView.center = self.view.center;
    
    [self.view addSubview:_activityView];
}

- (void)displayError {
    [[[UIAlertView alloc] initWithTitle:@"Ooops!"
                                message:@"Algo deu errado, tente novamente!"
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.personagens.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"TableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSDictionary *personagem = [self.personagens objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [personagem objectForKey:@"name"];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[personagem objectForKey:@"photo_url"]]
                      placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    [cell.imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    return cell;
}

- (IBAction)atualizarAction:(id)sender {
    [_activityView startAnimating];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:BACKEND_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.personagens = responseObject;
        
        [_tableView reloadData];
        [_activityView stopAnimating];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
        [_activityView stopAnimating];
        [self displayError];
    }];
}

@end
