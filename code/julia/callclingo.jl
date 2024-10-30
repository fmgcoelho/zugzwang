lib = "/usr/lib/libclingo.so"

major =     Ref{Cint}(0)
minor =     Ref{Cint}(0)
revision =  Ref{Cint}(0)

@ccall lib.clingo_version(
    major::Ref{Cint},
    minor::Ref{Cint},
    revision::Ref{Cint}
    )::Cvoid

println("clingo version: $(major[]).$(minor[]).$(revision[])")