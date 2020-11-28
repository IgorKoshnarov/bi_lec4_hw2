-module(p06).
-export([is_palindrome/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

is_palindrome(L) ->
    L =:= reverse(L).

reverse(L) ->
    reverse(L, []).

reverse([H | T], L) ->
    reverse(T, [H | L]);
reverse([], L) ->
    L.

-ifdef(TEST).

is_palindrome_test_() -> [
    {"is_palindrome([]) =:= true", ?_assertEqual(is_palindrome([]), true)},
    {"is_palindrome([1, 2, 3]) =:= false", ?_assertEqual(is_palindrome([1, 2, 3]), false)},
    {"is_palindrome([1, 2, 3, 2, 1]) =:= true", ?_assertEqual(is_palindrome([1, 2, 3, 2, 1]), true)}
].

-endif.