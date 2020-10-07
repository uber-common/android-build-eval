This repo includes auto-generated uber-agnostic android projects, buildable on Buck, Bazel and Gradle. These projects reflect the complexity of real Uber apps, in terms of # modules, classes, kotlin usages, module inter-dependencies, and external dependencies.

To build (from a top folder project):
- ./gradlew rootModule:assembleDebug
- bazel build rootModule
- ./buckw build rootModule:src_release

You can also use gradle-profiler (however we're using a custom version which supports clean commands needed by Buck and Bazel).