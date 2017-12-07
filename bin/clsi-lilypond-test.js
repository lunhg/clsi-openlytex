var child_process, mocha, path, uuid;

path = require('path');

child_process = require('child_process');

mocha = require('mocha');

uuid = require('uuid');

describe("Command test", function() {
  return it("should run a single list folders in root path", function() {
    return new Promise(function(resolve, reject) {
      var id, ly;
      id = "test-command-runner-" + uuid.v4();
      ly = new CommandRunner({
        project_id: id,
        directory: path.join(__dirname, '..'),
        command: "ls"
      });
      return ly.run({}).then(resolve).catch(reject);
    });
  });
});
