//
//  Document.h
//  CommandLineBundleSample
//
//  Created by 1024jp on 8/1/15.
//
//

@import Cocoa;

@interface Document : NSDocument

@end



@interface Document (ScriptingSupport)

@property (nonatomic, copy) NSString *content;

@end

