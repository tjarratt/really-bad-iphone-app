#import <Cedar-iOS/Cedar.h>

#import "HomeViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(HomeViewControllerSpec)

describe(@"The initial view controller", ^{
    __block HomeViewController *subject;

    beforeEach(^{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

        UINavigationController *navController = [storyboard instantiateInitialViewController];
        subject = (HomeViewController *)navController.topViewController;
        subject should be_instance_of([HomeViewController class]);
        subject.view should_not be_nil;
    });

    it(@"should have a welcome message", ^{
        subject.welcomeMessage.text should equal(@"Welcome User!");
    });

    it(@"should have a logo in the navigation bar", ^{
        subject.navigationItem.titleView should be_instance_of([UIImageView class]);
    });
});

SPEC_END

