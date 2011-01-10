/*
load("base.js");
load("crypto.js");
load("deltablue.js");
load("earley-boyer.js");
load("raytrace.js");
load("regexp.js");
load("richards.js");
load("splay.js");
*/
/*
 * Modified to run with Rhino, even the Rhino compiler
 */
var completed = 0;
var benchmarks = BenchmarkSuite.CountBenchmarks();
var success = true;

function ShowProgress(name) {
    /* no :( */
}


function AddResult(name, result) {
  var text = name + ': ' + result;
  print(text)
}


function AddError(name, error) {
  AddResult(name, 'error');
  success = false;
}


function AddScore(score) {
    /* no live status */
}


function Run() {
  BenchmarkSuite.RunSuites({ NotifyStep: ShowProgress,
                             NotifyError: AddError,
                             NotifyResult: AddResult,
                             NotifyScore: AddScore }); 
}

function ShowWarningIfObsolete() {
    // nope
}

function Load() {
  var version = BenchmarkSuite.version;
  print("V8 Benchmark Suite "+version);
  ShowWarningIfObsolete();  
  setTimeout(Run, 200);
}

/*
 * And now, the magic:
 */
Run()
