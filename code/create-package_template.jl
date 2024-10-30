using PkgTemplates

template = Template(;
    user = "fc@uevora.pt",            # github user name
    authors = ["Francisco Coelho"],   # list of authors
    dir = "/home/fc/sci/projetos/zugzwang/code/",              # dir in which the package will be created
    julia = v"1.7",                     # compat version of Julia
    plugins = [
        !CompatHelper,                  # disable CompatHelper
        !TagBot,                        # disable TagBot
        Readme(; inline_badges = true), # added readme file with badges
        Tests(; project = true),        # added Project.toml file for unit tests
        Git(; manifest = false),        # add manifest.toml to .gitignore
        License(; name = "MIT")         # addedMIT licence
    ],
)

template("ASP")
mkdir(joinpath("/home/fc/sci/projetos/zugzwang/code/", "ASP", "examples"))