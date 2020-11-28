-module(p01).
-export([last/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

last([N | []]) -> 
    N;
last([_ | T]) -> 
    last(T).

-ifdef(TEST).

last_test_() -> [
    {"last([1, 2, 3]) =:= 3", ?_assertEqual(last([1, 2, 3]), 3)},
    {"last([a, b, c, d]) =:= d", ?_assertEqual(last([a, b, c, d]), d)},
    {"last([1]) =:= 1", ?_assertEqual(last([1]), 1)},
    {"last([]) throws error", ?_assertException(error, function_clause, last([]))}
].


-endif.
