//
//  ViewController.m
//  RandomNumber
//
//  Created by 罗心 on 17/03/2017.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UITextField *numberInput;
@property (weak, nonatomic) IBOutlet UIButton *numberButton;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [_numberButton setImage:[UIImage imageNamed:@"板栗"] forState:UIControlStateNormal];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    
    [_numberInput resignFirstResponder];
    
    
    
}


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
    
    NSString *string = [mutalbeArr componentsJoinedByString:@""];

   _numberLabel.text = string;
    
}

- (IBAction)startButton:(id)sender {
    [self randomNumber];
    [_numberInput resignFirstResponder];
    
    AVSpeechSynthesizer *av = [[AVSpeechSynthesizer alloc]init];
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:_numberLabel.text]; //需要转换的文本
    utterance.
    [av speakUtterance:utterance];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
