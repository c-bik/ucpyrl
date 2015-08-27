-module(ucpyrl).

-behaviour(application).
-behaviour(supervisor).

%% Shell Applciation interafce
-export([start/0, stop/0]).

%% Application callbacks
-export([start/2, stop/1]).

%% Supervisor callbacks
-export([init/1]).

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
