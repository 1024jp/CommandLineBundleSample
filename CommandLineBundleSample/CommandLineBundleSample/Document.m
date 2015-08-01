//
//  Document.m
//  CommandLineBundleSample
//
//  Created by 1024jp on 8/1/15.
//
//

#import "Document.h"

@interface Document ()

@property (nonatomic) NSString *contentString;

@property (nonatomic) IBOutlet NSTextView *textView;

@end


@implementation Document

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    
    if (self.contentString) {
        self.textView.string = self.contentString;
    }
}

- (NSString *)windowNibName {
    return @"Document";
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    
    return [self.textView.string dataUsingEncoding:NSUTF8StringEncoding];
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    
    self.contentString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return YES;
}

@end


@implementation Document (ScriptingSupport)

- (void)setContent:(NSString *)content
{
    self.textView.string = content;
}

- (NSString *)content
{
    return self.textView.string;
}

@end
