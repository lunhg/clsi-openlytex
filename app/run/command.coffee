CommandRunner::run = () ->
        self = this
        new Promise (resolve, reject) ->
                proc = self.makeProcess()
                proc.on "error", self.error(reject)
                proc.on "close", self.done(resolve, reject, proc.pid)
