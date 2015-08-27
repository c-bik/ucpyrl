%% -*- erlang -*-
Definitions.

Rules.

% delimiters
(\x02)                              : {token, {stx, TokenLine}}.
(\x03)                              : {token, {etx, TokenLine}}.
(\x2F)                              : {token, {'/', TokenLine}}.
(\x2C)                              : {token, {',', TokenLine}}.
([0-9a-fA-F:OR]+)                   : {token, {'STR', TokenLine, ?debug(TokenChars)}}.
([\s\t\r\n]+)                       : skip_token.    %% white space

Erlang code.

-define(debug(T), T).
%-define(debug(T), begin io:format(user, "Token ~p~n", [T]), T end).
