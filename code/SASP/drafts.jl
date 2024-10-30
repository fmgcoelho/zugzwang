cmd1 = `clingo --verbose=0 --outf=0 --models=0 /home/fc/sci/projetos/zugzwang/code/SASP/temp.lp`

cmd3 = `clingo /home/fc/sci/projetos/zugzwang/code/SASP/temp.lp`

cmd2 = `clingo --help`

cmd4 = `echo hello`
cmd = Cmd(cmd1, ignorestatus=true)

println("running $cmd")
try
    s = readchomp(cmd)
    println("\nSuccess\n==\n$s\n==")
catch
    println("\nCaught")
end