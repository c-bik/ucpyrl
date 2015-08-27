%% -*- erlang -*-
Header "%% Copyright (C) razorpeak@gmail.com"
"%% @private"
"%% @Author Bikram Chatterjee"
"%% @Email razorpeak@gmail.com".

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Nonterminals
 ucp
 header
 body
 dat
.

Terminals
 STR
 'stx'
 'etx'
 '/'
.

Rootsymbol ucp.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ucp -> 'stx' header '/' body '/' dat 'etx'  : #{header => '$2', body => '$4', checksum => '$6'}.

        % TRN  /  LEN  /  O-R  /  OT
header -> dat '/' dat '/' dat '/' dat       : #{trn => '$1', len => '$3', op => '$5', ot => '$7'}.

body -> '$empty'                            : 'TBD'.
body -> STR                                 : unwrap('$1').

dat -> STR                                  : unwrap('$1').
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Erlang code.

unwrap({_,_,X}) -> X.
