//
//  ViewController.m
//  RandomNumber
//
//  Created by 罗心 on 17/03/2017.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()<AVSpeechSynthesizerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UITextField *numberInput;
@property (weak, nonatomic) IBOutlet UIButton *numberButton;
@property(strong, nonatomic) NSString * textString;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_numberButton setImage:[UIImage imageNamed:@"板栗"] forState:UIControlStateNormal];

}

//点击屏幕，隐藏键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [_numberInput resignFirstResponder];

}

//产生随机数
-(void)randomNumber{
    
    int value = 0;
    int iValue = [_numberInput.text intValue];
    NSMutableArray * mutalbeArr = [[NSMutableArray alloc]init];
    NSString * numberStr = [[NSString alloc]init];
    for(NSInteger i = 0; i <= iValue -1; i++){
        
         value = (arc4random() % 10);
        numberStr = [NSString stringWithFormat:@"%d",value];
        
        [mutalbeArr addObject:numberStr];
        
    }
    _textString = [mutalbeArr componentsJoinedByString:@","];

    NSString * str = [mutalbeArr componentsJoinedByString:@""];
    _numberLabel.text = str;
    
    NSLog(@"%@",_textString);

    
}

- (IBAction)startButton:(id)sender {
    [self randomNumber];
    [_numberInput resignFirstResponder];
    AVSpeechSynthesizer *av = [[AVSpeechSynthesizer alloc]init];

    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:_textString];
    utterance.rate = 0.5;
    [av pauseSpeakingAtBoundary:AVSpeechBoundaryWord];
    [av speakUtterance:utterance];


}



@end
