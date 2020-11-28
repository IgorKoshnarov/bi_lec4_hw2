-module(p05).
-export([reverse/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

reverse(L) ->
    reverse(L, []).

reverse([H | T], L) ->
    reverse(T, [H | L]);
reverse([], L) ->
    L.

-ifdef(TEST).

reverse_test_() -> [
    {"reverse([]) =:= []", ?_assertEqual(reverse([]), [])},
    {"reverse([1, 2, 3]) =:= [3, 2, 1]", ?_assertEqual(reverse([1, 2, 3]), [3, 2, 1])}
].

-endif.