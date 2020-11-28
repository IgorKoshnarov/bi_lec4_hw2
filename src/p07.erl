-module(p07).
-export([flatten/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

flatten(X) ->
    reverse(flatten(X, [])).

flatten([H | T], L) ->
    flatten(T, flatten(H, L));
flatten([], L) ->
    L;
flatten(X, L) ->
    [X | L].

reverse(X) ->
    reverse(X, []).

reverse([H | T], L) ->
    reverse(T, [H | L]);
reverse([], L) ->
    L.

-ifdef(TEST).

flatten_test_() -> [
    {"flatten([]) =:= []", ?_assertEqual(flatten([]), [])},
    {"flatten([a, b, c]) =:= [a, b, c]", ?_assertEqual(flatten([a, b, c]), [a, b, c])},
    {"flatten([a, [], c]) =:= [a, c]", ?_assertEqual(flatten([a, [], c]), [a, c])},
    {"flatten([a, [], [b, [c, d], e]]) =:= [a, b, c, d, e]", ?_assertEqual(flatten([a, [], [b, [c, d], e]]), [a, b, c, d, e])}
].

-endif.