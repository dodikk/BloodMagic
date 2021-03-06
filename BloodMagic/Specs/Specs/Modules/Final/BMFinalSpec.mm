#import "SpecHelper.h"
#import "BMFinalModel.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BMFinalSpec)

describe(@"BMFinalSpec", ^{
    
    __block BMFinalModel *model = nil;

    beforeEach(^{
        model = [BMFinalModel new];
    });
    
    afterEach(^{
        [model release];
    });
    
    it(@"should change value", ^{
        model.finalProperty = @"some value";
        model.finalProperty should equal(@"some value");
    });
    
    it(@"should change value only once", ^{
        model.finalProperty = @"some value";

        ^{
            model.finalProperty = @"value";
        } should raise_exception.with_reason(@"Attempt to change final property");
    });
    
});

SPEC_END
