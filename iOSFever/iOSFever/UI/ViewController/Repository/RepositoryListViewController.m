//
//  RepositoryListViewController.m
//  iOSFever
//
//  Created by Sandor Gazdag on 29/03/15.
//
//

#import "RepositoryListViewController.h"

#import "RepositoryDataProvider.h"
#import "Repository.h"
#import "Owner.h"
#import "Links.h"
#import "URLResource.h"

#import "RepositoryTableViewCell.h"

@implementation RepositoryListViewController {
	RepositoryDataProvider *_repositoryProvider;

	__weak IBOutlet UITableView *_tableView;
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];

	_repositoryProvider = [[RepositoryDataProvider alloc] init];

	__weak typeof(self) weakSelf = self;

	[_repositoryProvider repositoryPageWithCompletion: ^(NSArray *repositories, NSError *error) {
	    typeof(self) strongSelf = weakSelf;
	    if (strongSelf) {
	        [strongSelf->_tableView reloadData];
		}
	}];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [_repositoryProvider.repositoryList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	Repository *const repository = _repositoryProvider.repositoryList[indexPath.row];
	NSURL *const avatarURL = [NSURL URLWithString:repository.owner.links.avatar.href];

	RepositoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RepositoryTableViewCell" forIndexPath:indexPath];

	// Async cached download.
	[cell.avatarImageView sd_setImageWithURL:avatarURL];

	cell.titleLabel.text = repository.name;
	cell.subtitleLabel.text = repository.owner.displayName;

	return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.row == [_repositoryProvider.repositoryList count] - 1) {
		__weak typeof(self) weakSelf = self;

		[_repositoryProvider nextRepositoryPageWithCompletion: ^(NSArray *repositories, NSError *error) {
		    typeof(self) strongSelf = weakSelf;
		    if (strongSelf) {
		        [strongSelf->_tableView reloadData];
			}
		}];
	}
}

@end
