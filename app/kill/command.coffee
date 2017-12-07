CommandRunner::kill = (pid) ->
        self = this
        new Promise (resolve, reject) ->
                try
                        self.logger.warn({
                                pid:pid,
                                project_id:self.project_id,
                        }, "command killed")
                        process.kill -pid # kill all processes in group
                        resolve()
                catch err
                        self.logger.warn({
                                err:err,
                                project_id:self.project_id,
                        }, "error on kill command")
                        reject err
