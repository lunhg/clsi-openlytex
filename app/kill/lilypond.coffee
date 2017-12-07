LilypondRunner::killLilypond = (project_id) ->
        self = this
        new Promise (resolve, reject) ->
                id = "#{self.project_id}"
                @logger.log {id:id}, "killing running compile"
                if not ProcessTable[id]?
                        @logger.warn {id}, "no such project to kill"
                        reject new Error "no such project to kill"
                else
                        CommandRunner.kill(ProcessTable[id]).then(resolve).catch(reject)
