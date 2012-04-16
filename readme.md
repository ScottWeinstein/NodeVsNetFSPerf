## Simple benchmark of node vs CLR filesystem perf

To run test

    $testdir = "something"
    (1..5) | % { measure-command { netBenchmark\bin\Release\netBenchmark.exe $testdir } | % { $_.totalseconds }}
    (1..5) | % { measure-command { coffee .\nodeBenchmark\bench.coffee $testdir } | % { $_.totalseconds }}
