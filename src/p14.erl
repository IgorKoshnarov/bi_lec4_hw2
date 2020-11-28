-module(p14).
-export([duplicate/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

duplicate(L) ->
    reverse(duplicate(L, [])).

duplicate([H | T], L) ->
    duplicate(T, [H, H | L]);
duplicate([], L) ->
    L.

reverse(L) ->
    reverse(L, []).

reverse([H | T], L) ->
    reverse(T, [H | L]);
reverse([], L) ->
    L.

-ifdef(TEST).

duplicate_test_() -> [
    {"duplicate([]) =:= []", ?_assertEqual(duplicate([]), [])},
    {"duplicate([a,b,c,c,d]) =:= [a,a,b,b,c,c,c,c,d,d]",
     ?_assertEqual(duplicate([a,b,c,c,d]), [a,a,b,b,c,c,c,c,d,d])}
].

-endif.