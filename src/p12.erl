-module(p12).
-export([decode_modified/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

decode_modified(L) ->
    reverse(decode_modified(L, [])).

decode_modified([{1, H} | T], L) ->
    decode_modified(T, [H | L]);
decode_modified([{N, H} | T], L) ->
    decode_modified([{N - 1, H} | T], [H | L]);
decode_modified([H | T], L) ->
    decode_modified(T, [H | L]);
decode_modified([], L) ->
    L.

reverse(L) ->
    reverse(L, []).

reverse([H | T], L) ->
    reverse(T, [H | L]);
reverse([], L) ->
    L.

-ifdef(TEST).

decode_modified_test_() -> [
    {"decode_modified([]) =:= []", ?_assertEqual(decode_modified([]), [])},
    {"decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}]) =:= [a,a,a,a,b,c,c,a,a,d,e,e,e,e]", 
    ?_assertEqual(decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}]), [a,a,a,a,b,c,c,a,a,d,e,e,e,e])}
].

-endif.