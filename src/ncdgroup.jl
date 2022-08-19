export define_group
export get_group
export split_group

"""
    split_group(group) -> Vector{String}

Purse the input path of the group and split it into a vector.

# Arguments
- `group::AbstractString`: Input path of the group

# Examples
```julia-repl
julia> split_group("rootgroup/subgroup/subsubgroup")
3-element Vector{String}:
 "rootgroup"
 "subgroup"
 "subsubgroup"
```
"""
function split_group(group::AbstractString)::Vector{String}
    groups = splitpath(group)
    groups = deleteat!(groups, findall(x -> x == "/", groups))
    groups = deleteat!(groups, findall(x -> x == "", groups))
    return groups
end

"""
    get_group(dataset, groups) -> NCDataset

Get the given group specified in the given NCDataset.

# Arguments
- `dataset::NCDataset`:
    Input dataset
- `groups::AbstractVector`:
    A vector of strings for the path of the group.
    Assuming that this is an output of `split_group`.
"""
function get_group(dataset::NCDataset, groups::AbstractVector)::NCDataset
    curds = dataset
    if length(groups) > 0
        for group in groups
            curds = curds.group[group]
        end
    end
    return curds
end

"""
    define_group(dataset, groups) -> NCDataset

Define the given group in the given `dataset`.

# Arguments
- `dataset::NCDataset`:
    Input dataset
- `groups::AbstractVector`:
    A vector of strings for the path of the group.
    Assuming that this is an output of `split_group`.
"""
function define_group(dataset::NCDataset, groups::AbstractVector)::NCDataset
    ds = dataset
    if length(groups) > 0
        for group in groups
            defGroup(ds, group)
            ds = ds.group[group]
        end
    end
    return ds
end