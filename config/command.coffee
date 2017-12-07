# Little changes on
# - https://github.com/sharelatex/clsi-sharelatex/blob/master/app/coffee/CommandRunner.coffee
# with asynchronous method
# - see:
#   - /app/run/command.coffee
#   - /app/kill/command.coffee
#   - /test/command.coffee
class CommandRunner

        constructor: (opt) ->
                @project_id = opt.project_id
                @directory = opt.directory
                @command = opt.command
                
                 # merge environment settings
                @environment = opt.environment
                if opt.merge
                        for key, value of process.env
                                if not opt.environment[key]
                                        @environment[key] = value 
                
                @logger = bunyan.createLogger({name: "clsi-lilypond"})

        makeProcess: ->
                # Log this command
                @logger.info({
                        project_id:@project_id,
                        command: @command,
                        directory: @directory
                        env:@environment
                }, "running command")
                
                # run command as detached process
                # so it has its own process group (which can be killed if needed)
                cmd = @command[0]
                args = @command.slice(1)
                proc = child_process.spawn(cmd, args , {
                        stdio: "inherit",
                        cwd: @directory,
                        detached: true,
                        env: @environment
                })

        error: (reject) ->
                self = this
                (err)->
                        self.logger.info({
                                err:err,
                                project_id:self.project_id,
                                command: self.command,
                                directory: self.directory
                        }, "error running command")
                        reject err

        done: (resolve, reject, pid) ->
                self = this
                (code, signal) ->
                        self.logger.info({
                                code:code,
                                signal:signal,
                                project_id:self.project_id
                        }, "command exited")
        
                        if signal is 'SIGTERM' # signal from kill method below
                                err = new Error("terminated")
                                err.terminated = true
                                reject(err)
                        else if code is 1 # exit status from chktex
                                err = new Error("exited")
                                err.code = code
                                reject err
                        else
                                resolve(pid)
