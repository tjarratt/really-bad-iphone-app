#import <Cedar-iOS/Cedar.h>
#import <PivotalCoreKit/UIControl+Spec.h>

#import "UIColor+TestDrive.h"
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
        subject.welcomeMessage.text should equal(@"Welcome, User!");
    });

    it(@"should have a logo in the navigation bar", ^{
        subject.navigationItem.titleView should be_instance_of([UIImageView class]);
    });

    context(@"when the user taps on the textfield", ^{
        beforeEach(^{
            spy_on(subject.input);
            [subject.input tap];
        });

        context(@"when the user taps outside the textfield", ^{
            beforeEach(^{
                [subject touchesBegan:nil withEvent:nil];
                [subject touchesEnded:nil withEvent:nil];
            });

            it(@"should dismiss the keyboard when the user taps outside of the textfield", ^{
                subject.input should have_received(@selector(resignFirstResponder));
            });
        });
    });
});

SPEC_END

