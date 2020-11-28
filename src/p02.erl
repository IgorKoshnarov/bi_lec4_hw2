-module(p02).
-export([but_last/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

but_last([_, _] = X) -> 
    X;
but_last([_ | T]) -> 
    but_last(T).

-ifdef(TEST).

but_last_test_() -> [
    {"but_last([]) throws error", ?_assertException(error, function_clause, but_last([]))},
    {"but_last([1]) throws error", ?_assertException(error, function_clause, but_last([]))},
    {"but_last([1, 2, 3]) =:= [2, 3]", ?_assertEqual(but_last([1, 2, 3]), [2, 3])},
    {"but_last([a, b, c, d]) =:= [c, d]", ?_assertEqual(but_last([a, b, c, d]), [c, d])}
].

-endif.
