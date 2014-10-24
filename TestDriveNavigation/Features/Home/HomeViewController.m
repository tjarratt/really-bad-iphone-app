#import "HomeViewController.h"

@interface HomeViewController ()
@property (strong, nonatomic, readwrite) IBOutlet UILabel *welcomeMessage;
@property (strong, nonatomic, readwrite) IBOutlet UITextField *input;
@end

@implementation HomeViewController

-(void)viewDidLoad {
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logo" ofType:@"png"]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = imageView;

    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.input resignFirstResponder];
}

@end
