//
//  MVVMCell.m
//  RACExercise
//
//  Created by YPC on 17/1/3.
//  Copyright © 2017年 mgzzZ. All rights reserved.
//

#import "MVVMCell.h"

@interface MVVMCell ()
@property (nonatomic, strong) UIImageView *headerImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIImageView *articleImageView;

@property (nonatomic, strong) UILabel *articleLabel;

@property (nonatomic, strong) UIImageView *peopleImageView;

@property (nonatomic, strong) UILabel *peopleNumLabel;


@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIImageView *lineImageView;
@end

@implementation MVVMCell


- (void)zgm_setupViews {
    
    [self.contentView addSubview:self.headerImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.articleImageView];
    [self.contentView addSubview:self.articleLabel];
    [self.contentView addSubview:self.peopleImageView];
    [self.contentView addSubview:self.peopleNumLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.lineImageView];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)updateConstraints{
    self.headerImageView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,15)
    .bottomSpaceToView(self.contentView,15)
    .widthIs(75);
    [super updateConstraints];
}

- (void)setViewModel:(MMVMCellViewModel *)viewModel{
    if (!viewModel) {
        return;
    }
    _viewModel = viewModel;
    self.headerImageView.backgroundColor = [UIColor  redColor];
    self.nameLabel.text = viewModel.name;
    self.articleLabel.text = viewModel.articleNum;
    self.peopleNumLabel.text = viewModel.peopleNum;
    self.contentLabel.text = viewModel.content;
}
#pragma mark - lazyLoad
- (UIImageView *)headerImageView {
    
    if (!_headerImageView) {
        
        _headerImageView = [[UIImageView alloc] init];
    }
    
    return _headerImageView;
}

- (UILabel *)nameLabel {
    
    if (!_nameLabel) {
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont systemFontOfSize:15];
    }
    
    return _nameLabel;
}

- (UIImageView *)articleImageView {
    
    if (!_articleImageView) {
        
        _articleImageView = [[UIImageView alloc] init];
        _articleImageView.backgroundColor = [UIColor redColor];
    }
    
    return _articleImageView;
}

- (UILabel *)articleLabel {
    
    if (!_articleLabel) {
        
        _articleLabel = [[UILabel alloc] init];
        _articleLabel.textColor = [UIColor blackColor];
        _articleLabel.font = [UIFont systemFontOfSize:12];
    }
    
    return _articleLabel;
}

- (UIImageView *)peopleImageView {
    
    if (!_peopleImageView) {
        
        _peopleImageView = [[UIImageView alloc] init];
        _peopleImageView.backgroundColor = [UIColor redColor];
    }
    
    return _peopleImageView;
}

- (UILabel *)peopleNumLabel {
    
    if (!_peopleNumLabel) {
        
        _peopleNumLabel = [[UILabel alloc] init];
        _peopleNumLabel.textColor = [UIColor blackColor];
        _peopleNumLabel.font = [UIFont systemFontOfSize:12];
    }
    
    return _peopleNumLabel;
}

- (UILabel *)contentLabel {
    
    if (!_contentLabel) {
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.font = [UIFont systemFontOfSize:14];
    }
    
    return _contentLabel;
}

- (UIImageView *)lineImageView {
    
    if (!_lineImageView) {
        
        _lineImageView = [[UIImageView alloc] init];
        _lineImageView.backgroundColor = [UIColor blackColor];
    }
    
    return _lineImageView;
}

@end
