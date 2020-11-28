-module(p04).
-export([len/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

len(L) ->
    len(L, 0).

len([_ | T], N) ->
    len(T, N + 1);
len([], N) ->
    N.

-ifdef(TEST).

len_test_() -> [
    {"len([]) =:= 0", ?_assertEqual(len([]), 0)},
    {"len([1, 2, 3]) =:= 3", ?_assertEqual(len([1, 2, 3]), 3)}
].

-endif.