%% Showcase for ELP's `--format github` annotations, not meant to be merged.
%%
%% Every function below triggers an ELP finding on purpose, so that it shows
%% up as an annotation on the pull request, one per annotation level.
-module(meck_annotations_demo).

-export([double_all/1, to_atom/1, describe/1, config/0]).

%% Warning: W0002 (unused_macro)
-define(UNUSED_TIMEOUT, 5000).

%% Notices: W0066 (lists_map_to_comprehension) is a weak warning and
%% W0071 (redundant_fun_wrapper) an information
-spec double_all([number()]) -> [number()].
double_all(Numbers) ->
    lists:map(fun(N) -> double(N) end, Numbers).

-spec double(number()) -> number().
double(N) ->
    N * 2.

%% Error: eqWAlizer incompatible_types (term() is not atom())
-spec to_atom(term()) -> atom().
to_atom(Term) ->
    Term.

%% Warning: W0023 (atoms_exhaustion)
-spec describe(string()) -> atom().
describe(Name) ->
    list_to_atom(Name).

%% Error: eqWAlizer incompatible_types, with an explanation of the mismatch
-spec config() -> #{timeout := non_neg_integer()}.
config() ->
    #{timeout => infinity}.
