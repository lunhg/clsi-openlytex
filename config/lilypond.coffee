class LilypondRunner

        constructor: (opt) ->
                @mainFile = opt.mainFile
                @directory = opt.directory
                @timeout = opt.timeout or 60000
                @project_id = opt.project_id
