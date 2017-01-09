//
//  FDTableViewCell.m
//  FDCalenderView
//
//  Created by 徐忠林 on 07/01/2017.
//  Copyright © 2017 Feyddy. All rights reserved.
//

#import "FDTableViewCell.h"

@implementation FDTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
+(id) testCell
{
    return [[NSBundle mainBundle] loadNibNamed:@"FDTableViewCell" owner:nil
            
                                       options:nil][0];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
