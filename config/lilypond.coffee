class LilypondRunner

        constructor: (opt) ->
                @mainFile = opt.mainFile
                @directory = opt.directory
                @timeout = opt.timeout or 60000

                compile_file = @mainFile.split(".ly")[0]
                
                @command = [
                        "lilypond"
                        "--pdf"
                        "--output"
                        compile_file
                        @mainFile
                ]
