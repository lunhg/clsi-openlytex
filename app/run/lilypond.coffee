LilypondRunner::run = ->
        self = this
        new Promise (resolve, reject) ->
                id = "#{self.project_id}" 

                # The command
                compile_file = self.mainFile.split(".ly")[0]
                
                command = [
                        "lilypond"
                        "-dsafe"
                        "--pdf"
                        "--output"
                        compile_file
                        self.mainFile
                ]
                ProcessTable[id] = new CommandRunner({
                        project_id: self.project_id
                        command: command
                        directory: self.directory
                        environment:self.environment
                })

                onOutput = (output) ->
                        delete ProcessTable[id]
                        resolve(output)
                                
                onError  = (err) ->
                        reject err
                                
                ProcessTable[id].run().then(onOutput).catch(onError)
