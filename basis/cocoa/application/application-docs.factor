USING: debugger quotations help.markup help.syntax strings alien
core-foundation ;
IN: cocoa.application

HELP: <NSString>
{ $values { "str" string } { "alien" alien } }
{ $description "Allocates an autoreleased " { $snippet "CFString" } "." } ;

{ <NSString> <CFString> CF>string } related-words

HELP: <NSArray>
{ $values { "seq" "a sequence of " { $link alien } " instances" } { "alien" alien } }
{ $description "Allocates an autoreleased " { $snippet "CFArray" } "." } ;

{ <NSArray> <CFArray> } related-words

HELP: with-autorelease-pool
{ $values { "quot" quotation } }
{ $description "Sets up a new " { $snippet "NSAutoreleasePool"  } ", calls the quotation and frees the pool." } ;

HELP: NSApp
{ $values { "app" "an " { $snippet "NSApplication" } } }
{ $description "Pushes the current " { $snippet "NSApplication" } " singleton." } ;

HELP: with-cocoa
{ $values { "quot" quotation } }
{ $description "Sets up an autorelease pool, initializes the " { $snippet "NSApplication" } " singleton, and calls the quotation." } ;

HELP: do-event
{ $values { "app" "an " { $snippet "NSApplication" } } { "?" "a boolean" } }
{ $description "Processes a pending event in the queue, if any, returning a boolean indicating if there was one. Does not block." } ;

HELP: add-observer
{ $values { "observer" "an " { $snippet "NSObject" } } { "selector" string } { "name" "an " { $snippet "NSString" } } { "object" "an " { $snippet "NSObject" } } }
{ $description "Registers an observer with the " { $snippet "NSNotificationCenter" } " singleton." } ;

HELP: remove-observer
{ $values { "observer" "an " { $snippet "NSObject" } } }
{ $description "Unregisters an observer from the " { $snippet "NSNotificationCenter" } " singleton." } ;

HELP: install-delegate
{ $values { "receiver" "an " { $snippet "NSObject" } } { "delegate" "an Objective C class" } }
{ $description "Sets the receiver's delegate to a new instance of the delegate class." } ;

HELP: objc-error
{ $error-description "Thrown by the Objective C runtime when an error occurs, for example, sending a message to an object with an unrecognized selector." } ;

ARTICLE: "cocoa-application-utils" "Cocoa application utilities"
{ $subsection NSApp }
{ $subsection with-autorelease-pool }
{ $subsection with-cocoa }
{ $subsection do-event }
{ $subsection add-observer }
{ $subsection remove-observer }
{ $subsection install-delegate } ;

IN: cocoa.application
ABOUT: "cocoa-application-utils"