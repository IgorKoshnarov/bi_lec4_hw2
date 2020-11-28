-module(p11).
-export([encode_modified/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

encode_modified(L) ->
    reverse(encode_modified(L, [])).

encode_modified([H | T], [{N, H} | T1]) ->
    encode_modified(T, [{N + 1, H} | T1]);
encode_modified([H | T], [H | T1]) ->
    encode_modified(T, [{2, H} | T1]);
encode_modified([H | T], L) ->
    encode_modified(T, [H | L]);
encode_modified([], L) ->
    L.

reverse(L) ->
    reverse(L, []).

reverse([H | T], L) ->
    reverse(T, [H | L]);
reverse([], L) ->
    L.

-ifdef(TEST).

encode_modified_test_() -> [
    {"encode_modified([]) =:= []", ?_assertEqual(encode_modified([]), [])},
    {"encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [{4,a},b,{2,c},{2,a},d,{4,e}]", 
    ?_assertEqual(encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]), [{4,a},b,{2,c},{2,a},d,{4,e}])}
].

-endif.