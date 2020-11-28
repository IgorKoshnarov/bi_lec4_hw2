-module(p03).
-export([element_at/2]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

element_at([H | _], 1) ->
    H;
element_at([_ | T], N) ->
    element_at(T, N - 1);
element_at([], _) ->
    undefined.

-ifdef(TEST).

element_at_test_() -> [
    {"element_at([], 1) =:= undefined", ?_assertEqual(element_at([], 1), undefined)},
    {"element_at([a, b, c, d], 2) =:= b", ?_assertEqual(element_at([a, b, c, d], 2), b)},
    {"element_at([a, b, c, d, e, f], 4) =:= d", ?_assertEqual(element_at([a, b, c, d, e, f], 4), d)},
    {"element_at([a, b, c, d, e, f], 8) =:= undefined", ?_assertEqual(element_at([a, b, c, d, e, f], 8), undefined)}
].

-endif.
