var CommandRunner, LilypondRunner, child_process, clsi, id, mocha, path, uuid;

path = require('path');

child_process = require('child_process');

mocha = require('mocha');

uuid = require('uuid');

clsi = require('./clsi-lilypond');

CommandRunner = clsi.CommandRunner;

LilypondRunner = clsi.LilypondRunner;

id = uuid.v4();

describe("Command test", function() {
  return it("should echo lilypond Hello World", function() {
    return new Promise(function(resolve, reject) {
      var ly;
      ly = new CommandRunner({
        project_id: id,
        directory: path.join(__dirname, '..', 'examples'),
        command: ["lilypond", "--pdf", "--output", "main", "main.ly"],
        mergeNativeEnv: true
      });
      return ly.run().then(resolve).catch(reject);
    });
  });
});

describe("Lilypond test", function() {
  return it("should echo lilypond Hello World", function() {
    return new Promise(function(resolve, reject) {
      var ly;
      ly = new LilypondRunner({
        directory: path.join(__dirname, '..', 'examples'),
        mainFile: 'main2.ly',
        timeout: 60000
      });
      return ly.run().then(resolve).catch(reject);
    });
  });
});
