### Project description

This repo includes auto-generated uber-agnostic large android projects, buildable on Buck, Bazel and Gradle. 

These projects reflect the complexity of real Uber apps, in terms of :
-  number of modules, classes and resources
-  java Vs kotlin code
-  module inter-dependencies
-  dependencies on external libraries

When building these project, we voluntarily disable lint, error prone and annotation processor. It's possible these could affect the observed trends.
Also, optimization of individual build system is currently not done : we're using pretty much plain vanilla settings and only obvious perf improvements.

#### Targets

- `apps_eats_app_root_apk` : Uber Eats-like anonymized application
- `apps_presidio_helix_app` : Uber Rider-like anonymized application

#### Full build

To build project from scratch, open a terminal and change directory to top folder project, and run corresponding command line for the build system you want to use :
- ./gradlew rootModule:assembleDebug
- bazel build rootModule
- ./buckw build rootModule:src_release

#### Incremental build

We used special naming for a couple of modules, these can be used to simulate various incremental builds :
- rootModule : the top project module (i.e any module in the project is a transitive dependency on this module)
- leafModuleMin/Avg/Max : these are modules on which some other modules depend on. Min = only a few modules depends on this module, Max = a lot of modules depends on this module (i.e rebuilding a ABI change of this module will cause a somehow large part of the build graph to be invalidated)

To simplify creating code changes simulating incremental build, we use gradle-profiler. 
Warning : in order to clean up build cache between invokation if Bazel and Buck, we use a custom fork of grade-profiler. We could share it as well if needed.

#### Example of recorded metrics

|   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|
|scenario|cleanWithColdLocalCache|cleanWithColdLocalCacheWithDaemon|abiChangeWithMaxLeafLocalCache|nonAbiChangeWithMaxLeafLocalCache|androidResourceChangeWithRootLocalCache|noOpLocalCache
gradle|353880.3333|148685.6667|135891|72432|71129.33333|70183
Buck|303295.6667|298654.3333|94661.66667|51526|48407.33333|46902.33333
Bazel|1779829.333|1712104|883976.3333|4032|8514.333333|1742.666667

