-module(ucpyrl).

-behaviour(application).
-behaviour(supervisor).

%% Shell Applciation interafce
-export([start/0, stop/0]).

%% Application callbacks
-export([start/2, stop/1]).

%% Supervisor callbacks
-export([init/1]).

-export([test/0]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start() -> application:start(?MODULE).
start(_StartType, _StartArgs) ->
    io:format(user, "starting ucpyrl application...~n", []),
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

stop() -> application:stop(?MODULE).
stop(_State) ->
    io:format(user, "stopping ucpyrl application...~n", []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    io:format(user, "starting ucpyrl supervisor...~n", []),
    {ok, { {one_for_one, 5, 10}, []} }.


test() ->
    parse([16#02]++"00/00038/R/53//46"++[16#03]).

parse(Data) when is_list(Data) ->
    case ucpyrl_lexer:string(Data) of
        {ok, Tokens, _} ->
            case ucpyrl_grammer:parse(Tokens) of
                {ok, ParseTree} -> ParseTree;
                Error -> {Error, Tokens}
            end;
        Error -> Error
    end.
