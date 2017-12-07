LilypondRunner::run = ->
        self = this
        new Promise (resolve, reject) ->
                
                # record running project under this id
                project_id = uuid.v4()
                id = "#{project_id}" 

                # The command
                command = @_lilypondCommand
                ProcessTable[id] = new CommandRunner({
                        project_id: project_id,
                        command: self.command,
                        directory: self.directory
                        mergeNativeEnv:true
                })

                onOutput = (output) ->
                        delete ProcessTable[id]
                        resolve(output)
                                
                onError  = (err) ->
                        reject err
                                
                ProcessTable[id].run().then(onOutput).catch(onError)
