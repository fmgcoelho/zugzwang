:- module(scasp_html_head, [load_html_head/1]).

load_html_head('<!doctype html>\n <html>\n <head>\n <meta charset="utf-8">\n <title>c(ASP) Justification</title>\n <style>\n.treemenu li { list-style: none; }\n.treemenu .toggler { cursor: pointer; }\n.treemenu .toggler:before { display: inline-block; margin-right: 2pt; }\nli.tree-empty > .toggler { opacity: 0.3; cursor: default; }\nli.tree-empty > .toggler:before { content: " "; }\nli.tree-closed > .toggler:before {\n    content: "";\n    height: 0;\n    width: 0;\n    border-color: transparent blue;\n    border-style: solid;\n    border-width: 0.25em 0 0.25em 0.5em;\n}\nli.tree-opened > .toggler:before {\n    content: "";\n    height: 0;\n    width: 0;\n    border-color: blue transparent ;\n    border-style: solid;\n    border-width: 0.5em 0.25em 0 0.25em;\n}\n</style>\n \n <link rel="icon" href="logo.ico">\n \n </head>\n \n <body style="font-size:15px;background: #ECECEC; margin:80px; color:#333;">\n \n').