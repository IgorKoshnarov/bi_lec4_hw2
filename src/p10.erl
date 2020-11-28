-module(p10).
-export([encode/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

encode(L) ->
    reverse(encode(L, [])).

encode([H | T], [{N, H} | T1]) ->
    encode(T, [{N + 1, H} | T1]);
encode([H | T], L) ->
    encode(T, [{1, H} | L]);
encode([], L) ->
    L.

reverse(L) ->
    reverse(L, []).

reverse([H | T], L) ->
    reverse(T, [H | L]);
reverse([], L) ->
    L.

-ifdef(TEST).

encode_test_() -> [
    {"encode([]) =:= []", ?_assertEqual(encode([]), [])},
    {"encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= []", 
    ?_assertEqual(encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]), [{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}])}
].

-endif.