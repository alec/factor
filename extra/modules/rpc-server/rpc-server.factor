! Copyright (C) 2009 Sam Anklesaria.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors assocs combinators continuations effects
io.encodings.binary io.servers.connection kernel namespaces
sequences serialize sets threads vocabs vocabs.parser init ;
IN: modules.rpc-server

<PRIVATE
TUPLE: rpc-request args vocabspec wordname ;
SYMBOL: serving-vocabs serving-vocabs [ V{ } clone ] initialize

: getter ( -- ) deserialize dup serving-vocabs get-global index
        [ vocab-words [ stack-effect ] { } assoc-map-as ]
        [ \ no-vocab boa ] if serialize ;

: doer ( -- ) deserialize dup vocabspec>> serving-vocabs get-global index
        [ [ args>> ] [ wordname>> ] [ vocabspec>> vocab-words ] tri at [ execute ] curry with-datastack ]
        [ vocabspec>> \ no-vocab boa ] if serialize ;

PRIVATE>
SYNTAX: service current-vocab name>> serving-vocabs get-global adjoin ;

[ [ binary <threaded-server>
    "rpcs" >>name 9012 >>insecure
    [ break deserialize {
      { [ "getter" ] [ getter ] }
      { [  "doer" ] [ doer ] }
      { [ "loader" ] [ deserialize vocab serialize ] } 
    } case ] >>handler
    start-server ] in-thread drop
] "modules.rpc-server" add-init-hook