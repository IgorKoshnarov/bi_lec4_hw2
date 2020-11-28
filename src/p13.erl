-module(p13).
-export([decode/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

decode(L) ->
    reverse(decode(L, [])).

decode([{1, H} | T], L) ->
    decode(T, [H | L]);
decode([{N, H} | T], L) ->
    decode([{N - 1, H} | T], [H | L]);
decode([], L) ->
    L.

reverse(L) ->
    reverse(L, []).

reverse([H | T], L) ->
    reverse(T, [H | L]);
reverse([], L) ->
    L.

-ifdef(TEST).

decode_test_() -> [
    {"decode([]) =:= []", ?_assertEqual(decode([]), [])},
    {"decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]) =:= [a,a,a,a,b,c,c,a,a,d,e,e,e,e]", 
    ?_assertEqual(decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]), [a,a,a,a,b,c,c,a,a,d,e,e,e,e])}
].

-endif.