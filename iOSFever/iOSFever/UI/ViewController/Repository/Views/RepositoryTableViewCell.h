//
//  RepositoryTableViewCell.h
//  iOSFever
//
//  Created by Sandor Gazdag on 29/03/15.
//  
//

@import UIKit;

#import <SDWebImage/UIImageView+WebCache.h>

@interface RepositoryTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *avatarImageView;

@end
