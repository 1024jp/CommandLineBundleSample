//
//  main.m
//  bundled_command
//
//  Created by 1024jp on 8/1/15.
//
//

@import Foundation;
#import "CommandLineBundleSample.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        switch (argc) {
            case 1:
                printf("Hello, pass me a file path.\n");
                return 0;
            case 2:
                break;
            default:
                printf("The command can take just one argument.\n");
                return 1;
        }
        
        // make URL object from argument
        NSURL *url = [[NSURL fileURLWithFileSystemRepresentation:argv[1] isDirectory:NO relativeToURL:nil] URLByStandardizingPath];
        
        printf("absolute path: %s/n", [url fileSystemRepresentation]);
        
        // create scriptable application object
        CommandLineBundleSampleApplication *application = [SBApplication applicationWithBundleIdentifier:@"com.wolfrosch.CommandLineBundleSample"];
        
        // let application open the given file
        [application open:@[url]];
        [application activate];
    }
    return 0;
}
