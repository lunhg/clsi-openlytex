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
  return it("should make a C major arpeggio", function() {
    return new Promise(function(resolve, reject) {
      var ly;
      ly = new CommandRunner({
        project_id: id,
        directory: path.join(__dirname, '..', 'examples'),
        command: ["lilypond", "-dsafe", "--pdf", "--output", "main", "main.ly"]
      });
      return ly.run().then(resolve).catch(reject);
    });
  });
});

describe("Lilypond test", function() {
  return it("should make a G major arpeggio", function() {
    return new Promise(function(resolve, reject) {
      var ly;
      ly = new LilypondRunner({
        project_id: uuid.v4(),
        directory: path.join(__dirname, '..', 'examples'),
        mainFile: 'main2.ly',
        merge: true
      });
      return ly.run().then(resolve).catch(reject);
    });
  });
});
