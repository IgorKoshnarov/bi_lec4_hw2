-module(p15).
-export([replicate/2]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

replicate(L, N) ->
    reverse(replicate(L, N, N, [])).

replicate([H | T], N, 1, L) ->
    replicate(T, N, N, [H | L]);
replicate([H | T], N, C, L) ->
    replicate([H | T], N, C - 1, [H | L]);
replicate([], _, _, L) ->
    L.

reverse(L) ->
    reverse(L, []).

reverse([H | T], L) ->
    reverse(T, [H | L]);
reverse([], L) ->
    L.

-ifdef(TEST).

replicate_test_() -> [
    {"replicate([], 3) =:= []", ?_assertEqual(replicate([], 3), [])},
    {"replicate([a,b,c,c,d], 3) =:= [a,a,a,b,b,b,c,c,c,c,c,c,d,d,d]",
     ?_assertEqual(replicate([a,b,c,c,d], 3), [a,a,a,b,b,b,c,c,c,c,c,c,d,d,d])}
].

-endif.