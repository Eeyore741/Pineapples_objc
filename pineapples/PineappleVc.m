//
//  PineappleVc.m
//  pineapples
//
//  Created by Vitaliy Kuznetsov on 30/06/2018.
//  Copyright © 2018 vitaliikuznetsov. All rights reserved.
//

#import "PineappleVc.h"

@interface PineappleVc ()

@property (weak, nonatomic) IBOutlet UILabel *flagLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (assign, nonatomic) int pineappleCount;

@end

@implementation PineappleVc

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.pineappleCount = 0;
    [self actualizeFlagLabel];
}

- (void)actualizeFlagLabel {
    
    if ([NSLocale.currentLocale.languageCode isEqualToString:@"ar"]) {
        
        self.flagLabel.text = @"🇸🇦";
    }
    else
        if ([NSLocale.currentLocale.languageCode isEqualToString:@"ru"]) {
            
            self.flagLabel.text = @"🇷🇺";
        }
        else
            if ([NSLocale.currentLocale.languageCode isEqualToString:@"en"]) {
                
                self.flagLabel.text = @"🇬🇧";
            }
            else{
                
                self.flagLabel.text = @"?";
            }
}

- (void)actualizeTextLabel{
    
    NSString *title = nil;
    title = NSLocalizedString(@"johns pineapples count", nil);
    title = [NSString localizedStringWithFormat:title, self.pineappleCount];
    
    NSLog(@"%@", title);
    
//    NSString *sss = [[NSString alloc] initWithFormat:@"%d", self.pineappleCount];
//    if (self.pineappleCount >= 10) {
//
//        int secondLastDigit = [[sss substringWithRange:NSMakeRange(sss.length-2, 1)] intValue];
//
//        if (secondLastDigit == 1) {
//
//            title = [NSString stringWithFormat:@"у Маши %d ананасов", self.pineappleCount];
//            self.textLabel.text = title;
//            return;
//        }
//    }
//    int oneLastDigit = [[sss substringFromIndex:sss.length-1] intValue];
//
//    if (oneLastDigit == 0 || (oneLastDigit > 4 && oneLastDigit <= 9)) {
//
//        title = [NSString stringWithFormat:@"у Маши %d ананасов", self.pineappleCount];
//    }
//    else
//        if (oneLastDigit == 1) {
//
//            title = [NSString stringWithFormat:@"у Маши %d ананас", self.pineappleCount];
//        }
//        else
//            if (oneLastDigit >= 2 && oneLastDigit <= 4) {
//
//                title = [NSString stringWithFormat:@"у Маши %d ананаса", self.pineappleCount];
//            }
    self.textLabel.text = title;
}

- (NSString *)pineappleStringWithCount:(int)count{
    
    if (count == 0) {
        
        return @"нет ананасов";
    }
    
    NSString *countString = [[NSString alloc] initWithFormat:@"%d", self.pineappleCount];
    
    if (self.pineappleCount >= 10) {
        
        int secondLastDigit = [[countString substringWithRange:NSMakeRange(countString.length-2, 1)] intValue];
        
        if (secondLastDigit == 1) {
            
            return [NSString stringWithFormat:@"у Маши %d ананасов", count];
        }
    }
    int oneLastDigit = [[countString substringFromIndex:countString.length-1] intValue];
    
    if (oneLastDigit == 0 || (oneLastDigit > 4 && oneLastDigit <= 9)) {
        
        return [NSString stringWithFormat:@"у Маши %d ананасов", count];
    }
    else
        if (oneLastDigit == 1) {
            
            return [NSString stringWithFormat:@"у Маши %d ананас", count];
        }
        else
            if (oneLastDigit >= 2 && oneLastDigit <= 4) {
                
                return [NSString stringWithFormat:@"у Маши %d ананаса", count];
            }
    return nil;
}

-(void)setPineappleCount:(int)pineappleCount{
    
    _pineappleCount = pineappleCount;
    [self actualizeTextLabel];
}

#pragma mark - IB actions

- (IBAction)onMinusButtonClick:(id)sender {
    
    if (self.pineappleCount > 0) {
        
        self.pineappleCount--;
    }
}

- (IBAction)onPlusButtonClick:(id)sender {
    
    self.pineappleCount++;
}

@end
