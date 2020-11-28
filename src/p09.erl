-module(p09).
-export([pack/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

pack(L) ->
    reverse(pack(L, [])).

pack([H | T], [[H | T1] | T2]) ->
    pack(T, [[H, H | T1] | T2]);
pack([H | T], L) ->
    pack(T, [[H] | L]);
pack([], L) ->
    L.

reverse(L) ->
    reverse(L, []).

reverse([H | T], L) ->
    reverse(T, [H | L]);
reverse([], L) ->
    L.

-ifdef(TEST).

pack_test_() -> [
    {"pack([]) =:= []", ?_assertEqual(pack([]), [])},
    {"pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]",
     ?_assertEqual(pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]), [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]])}
].

-endif.