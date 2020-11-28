-module(p08).
-export([compress/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

compress(L) ->
    compress(L, []).

compress([H, H | T], L) ->
    compress([H | T], L);
compress([H | T], L) ->
    compress(T, [H | L]);
compress([], L) ->
    reverse(L).

reverse(L) ->
    reverse(L, []).

reverse([H | T], L) ->
    reverse(T, [H | L]);
reverse([], L) ->
    L.

-ifdef(TEST).

compress_test_() -> [
    {"compress([]) =:= []", ?_assertEqual(compress([]), [])},
    {"compress([a, a, b, b, b, c, c, c, c, a, a, d, e, e, e]) =:= [a, b, c, a, d, e]",
     ?_assertEqual(compress([a, a, b, b, b, c, c, c, c, a, a, d, e, e, e]), [a, b, c, a, d, e])}
].

-endif.