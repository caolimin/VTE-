//
//  ViewController.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/11.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "ViewController.h"
#import "NewSecondViewController.h"

@interface ViewController ()
@property(nonatomic,strong) UIView * contView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"AI疾病(风险)管理系统";
    [self setupUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}

-(void)setupUI
{
    
    UIImageView * backImgaeView  = [[UIImageView alloc] initWithFrame:self.view.bounds];
    //backImgaeView.backgroundColor = [UIColor orangeColor];
    backImgaeView.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:backImgaeView];
    
    CGFloat contViewH = 500;
    CGFloat contViewW = 500;
    
    
    UIImageView * contentImageView = [[UIImageView alloc] init];
    contentImageView.image = [UIImage imageNamed:@"bg_pad"];
    contentImageView.frame = CGRectMake(0, 0, contViewW, contViewH);
    contentImageView.center = self.view.center;
    [self.view addSubview:contentImageView];
    
    
    UIView * contView = [[UIView alloc] init];
    self.contView = contView;
    contView.alpha = 0.5;
    contView.frame = CGRectMake(0, 0, contViewW, contViewH);
    contView.center = self.view.center;
  //  contView.backgroundColor = [UIColor redColor];
    [self.view addSubview:contView];
    
    
    
//    CGFloat iconImgaeViewX =
    CGFloat iconImgaeViewY = 30;
    CGFloat iconImgaeViewW = 120;
  //  CGFloat iconImgaeViewH =
    UIImageView * iconImgaeView  = [[UIImageView alloc] initWithFrame:CGRectMake((contViewW - iconImgaeViewW)/2, iconImgaeViewY, iconImgaeViewW, iconImgaeViewW)];
    iconImgaeView.image = [UIImage imageNamed:@"LOGO"];
  //  iconImgaeView.backgroundColor = [UIColor blueColor];
    [contView addSubview:iconImgaeView];
    
  //  CGFloat iconImgaeViewY = 30;
    CGFloat nameImgaeViewW = 40;
    CGFloat margin = 20;
    CGFloat nameFieldW = 200;
    CGFloat nameFieldH = 40;
    //  CGFloat iconImgaeViewH =
    UIImageView * nameImgaeView  = [[UIImageView alloc] initWithFrame:CGRectMake((contViewW - nameImgaeViewW - margin - nameFieldW)/2, CGRectGetMaxY(iconImgaeView.frame) + margin * 1.5, nameImgaeViewW, nameImgaeViewW)];
  //  nameImgaeView.backgroundColor = [UIColor blueColor];
    nameImgaeView.image = [UIImage imageNamed:@"user"];
    [contView addSubview:nameImgaeView];
    
    
    UITextField * nameField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(nameImgaeView.frame) + margin, CGRectGetMinY(nameImgaeView.frame), nameFieldW, nameFieldH)];
  //  nameField.backgroundColor = [UIColor blueColor];
    [nameField setBackground:[UIImage imageNamed:@"line"]];
    nameField.textColor = [UIColor lightGreenColor];
    [contView addSubview:nameField];

    UIImageView * passWordImgaeView  = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(nameImgaeView.frame), CGRectGetMaxY(nameImgaeView.frame)+ margin, nameImgaeViewW, nameImgaeViewW)];
   // passWordImgaeView.backgroundColor = [UIColor blueColor];
    passWordImgaeView.image = [UIImage imageNamed:@"pwd"];
    [contView addSubview:passWordImgaeView];
    
    UITextField * passWordField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(passWordImgaeView.frame) + margin, CGRectGetMinY(passWordImgaeView.frame), nameFieldW, nameFieldH)];
    passWordField.textColor = [UIColor lightGreenColor];
    passWordField.secureTextEntry = YES;
    passWordField.background = [UIImage imageNamed:@"line"];
   // passWordField.backgroundColor = [UIColor blueColor];
    [contView addSubview:passWordField];
    
    CGFloat loginBtnW = 200;
    CGFloat loginBtnH = 40;
    UIButton * loginBtn = [[UIButton alloc] init];
    [loginBtn setBackgroundColor:[UIColor lightGreenColor]];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.frame = CGRectMake((contViewW - loginBtnW)/2, CGRectGetMaxY(passWordImgaeView.frame) + margin, loginBtnW, loginBtnH);
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [contView addSubview:loginBtn];
    
    CGFloat forgetPassBtnW = 100;
    CGFloat forgetPassBtnH = 40;
    UIButton * forgetPassBtn = [[UIButton alloc] init];
   // [forgetPassBtn setBackgroundColor:[UIColor navigationBarColor]];
    [forgetPassBtn setTitleColor:[UIColor lightGreenColor] forState:UIControlStateNormal];
    forgetPassBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [forgetPassBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgetPassBtn.frame = CGRectMake((contViewW - forgetPassBtnW *2)/4, CGRectGetMaxY(loginBtn.frame) + margin, forgetPassBtnW, forgetPassBtnH);
    [forgetPassBtn addTarget:self action:@selector(forgetPassBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [contView addSubview:forgetPassBtn];
    
    CGFloat regisBtnW = 100;
    CGFloat regisBtnH = 40;
    UIButton * regisBtn = [[UIButton alloc] init];
    // [forgetPassBtn setBackgroundColor:[UIColor navigationBarColor]];
    [regisBtn setTitleColor:[UIColor lightGreenColor] forState:UIControlStateNormal];
    regisBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [regisBtn setTitle:@"申请注册" forState:UIControlStateNormal];
    regisBtn.frame = CGRectMake((contViewW - forgetPassBtnW *2)/4 * 3 + forgetPassBtnW, CGRectGetMinY(forgetPassBtn.frame), regisBtnW, regisBtnH);
    [regisBtn addTarget:self action:@selector(regisBtnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [contView addSubview:regisBtn];
//    CGFloat forgetPassLabelW = 120;
//    CGFloat forgetPassLabelH = 40;
//    UILabel * forgetPassLabel = [[UILabel alloc] init];
//    forgetPassLabel.frame  = CGRectMake((contViewW - forgetPassLabelW*2)/4 * 1, CGRectGetMaxY(btn.frame) + margin, forgetPassLabelW, forgetPassLabelH);
//    forgetPassLabel.text  =@"忘记密码";
}

-(void)loginBtnClick:(UIButton *)btn
{
    
    NewSecondViewController * controller = [[NewSecondViewController alloc] init];
        [self.navigationController pushViewController:controller animated:NO];
    
//    SecondViewController *vc = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
//
//    [self.navigationController pushViewController:vc animated:YES];

//    SecondViewController * controller = [[SecondViewController alloc] init];
//    [self.navigationController pushViewController:controller animated:NO];
}

-(void)forgetPassBtnClick:(UIButton *)btn
{
    
}

-(void)regisBtnBtnClick:(UIButton *)btn
{
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)keyboardWillChangeFrame:(NSNotification *)note
{
   // if (!self.patientIDFlag)  return;
    // 键盘显示\隐藏完毕的frame
    CGRect frame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 动画时间
    
//    CGRect frame1 = self.seniorBtn.frame;
//    CGFloat aa = CGRectGetMaxY(frame1);
//    CGFloat bb = HEIGHT  - aa;
//    CGFloat disY = bb - frame.size.height;
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    // 动画
    [UIView animateWithDuration:duration animations:^{
        if (frame.origin.y == HEIGHT) {
            self.contView.transform = CGAffineTransformIdentity;
        }else
        {
            self.contView.transform = CGAffineTransformMakeTranslation(0, -120 );
        }
    }];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
