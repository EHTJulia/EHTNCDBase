export ncdmodes

"""
    ncdmodes::NamedTuple

A named tuple relating Symbols to actual strings for the access mode to netCDF files
using NCDatasets.jl. Keys are:

# Keys and Values
- `:read`: 
    open an existing netCDF file or OPeNDAP URL in read-only mode (`"r"` in NCDatasets.jl).
- `:create`:
    create a new NetCDF file (an existing file with the same name will be overwritten;
    `"c"` in NCDatasets.jl)
- `:append`:
    open filename into append mode (i.e. existing data in the netCDF file is 
    not overwritten; `"a"` in NCDatasets.jl)
"""
const ncdmodes = (
    read="r",
    create="c",
    append="a",
)