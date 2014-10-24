#import "HomeViewController.h"

@interface HomeViewController ()
@property (strong, nonatomic, readwrite) IBOutlet UILabel *welcomeMessage;
@end

@implementation HomeViewController

-(void)viewDidLoad {
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logo" ofType:@"png"]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = imageView;

    [super viewDidLoad];
}

@end
