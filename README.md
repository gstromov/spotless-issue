# About this repository

This public repository demonstrates an issue encountered while using Spotless and the SQL formatter.

This document has been created according [the official template](https://github.com/diffplug/spotless/blob/04d5f28c0401803323b3e8d82677fc081ab2b818/ISSUE_TEMPLATE.md).

## Summary of the problem

When applying DBeaver formatting to [a view containing a recursive CTE](src%2Fmain%2Fresources%2Fdb%2Fsql%2Fmain%2F0003.requirements_hierarchy_view.sql) (Common Table Expression), an ```IndexOutOfBoundsException``` is encountered.

Note that this exception does not cause the build process to fail; instead, the stack trace is printed to the console.

## Gradle or Maven version

### Gradle Version

```8.7```, Gradle Wrapper with Kotlin DSL

### Spotless plugin

```6.25.0```

### JDK version

```JDK 21```, different vendors

## Operating System and Version

OS ```Windows 10 Pro```, version ```22H2```, build ```19045.3393```

## Stacktrace from the CLI

Command to execute:
```
./gradlew clean spotlessApply
```

Stacktrace: 
```
$ ./gradlew clean spotlessApply

> Task :spotlessSql
java.lang.IndexOutOfBoundsException: Index 243 out of bounds for length 243
        at java.base/jdk.internal.util.Preconditions.outOfBounds(Preconditions.java:100)
        at java.base/jdk.internal.util.Preconditions.outOfBoundsCheckIndex(Preconditions.java:106)
        at java.base/jdk.internal.util.Preconditions.checkIndex(Preconditions.java:302)
        at java.base/java.util.Objects.checkIndex(Objects.java:385)
        at java.base/java.util.ArrayList.get(ArrayList.java:427)
        at com.diffplug.spotless.sql.dbeaver.SQLTokenizedFormatter.insertReturnAndIndent(SQLTokenizedFormatter.java:405)
        at com.diffplug.spotless.sql.dbeaver.SQLTokenizedFormatter.format(SQLTokenizedFormatter.java:264)
        at com.diffplug.spotless.sql.dbeaver.SQLTokenizedFormatter.format(SQLTokenizedFormatter.java:62)
        at com.diffplug.spotless.sql.DBeaverSQLFormatter.format(DBeaverSQLFormatter.java:36)
        at com.diffplug.spotless.FormatterFunc.apply(FormatterFunc.java:32)
        at com.diffplug.spotless.FormatterStepImpl$Standard.format(FormatterStepImpl.java:82)
        at com.diffplug.spotless.FormatterStep$Strict.format(FormatterStep.java:103)
        at com.diffplug.spotless.Formatter.compute(Formatter.java:246)
        at com.diffplug.spotless.PaddedCell.calculateDirtyState(PaddedCell.java:203)
        at com.diffplug.spotless.PaddedCell.calculateDirtyState(PaddedCell.java:190)
        at com.diffplug.gradle.spotless.SpotlessTaskImpl.processInputFile(SpotlessTaskImpl.java:105)
        at com.diffplug.gradle.spotless.SpotlessTaskImpl.performAction(SpotlessTaskImpl.java:89)
        at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:103)
        at java.base/java.lang.reflect.Method.invoke(Method.java:580)
        at org.gradle.internal.reflect.JavaMethod.invoke(JavaMethod.java:125)
        at org.gradle.api.internal.project.taskfactory.IncrementalTaskAction.doExecute(IncrementalTaskAction.java:45)
        at org.gradle.api.internal.project.taskfactory.StandardTaskAction.execute(StandardTaskAction.java:51)
        at org.gradle.api.internal.project.taskfactory.IncrementalTaskAction.execute(IncrementalTaskAction.java:26)
        at org.gradle.api.internal.project.taskfactory.StandardTaskAction.execute(StandardTaskAction.java:29)
        at org.gradle.api.internal.tasks.execution.TaskExecution$3.run(TaskExecution.java:244)
        at org.gradle.internal.operations.DefaultBuildOperationRunner$1.execute(DefaultBuildOperationRunner.java:29)
        at org.gradle.internal.operations.DefaultBuildOperationRunner$1.execute(DefaultBuildOperationRunner.java:26)
        at org.gradle.internal.operations.DefaultBuildOperationRunner$2.execute(DefaultBuildOperationRunner.java:66)
        at org.gradle.internal.operations.DefaultBuildOperationRunner$2.execute(DefaultBuildOperationRunner.java:59)
        at org.gradle.internal.operations.DefaultBuildOperationRunner.execute(DefaultBuildOperationRunner.java:157)
        at org.gradle.internal.operations.DefaultBuildOperationRunner.execute(DefaultBuildOperationRunner.java:59)
        at org.gradle.internal.operations.DefaultBuildOperationRunner.run(DefaultBuildOperationRunner.java:47)
        at org.gradle.internal.operations.DefaultBuildOperationExecutor.run(DefaultBuildOperationExecutor.java:68)
        at org.gradle.api.internal.tasks.execution.TaskExecution.executeAction(TaskExecution.java:229)
        at org.gradle.api.internal.tasks.execution.TaskExecution.executeActions(TaskExecution.java:212)
        at org.gradle.api.internal.tasks.execution.TaskExecution.executeWithPreviousOutputFiles(TaskExecution.java:195)
        at org.gradle.api.internal.tasks.execution.TaskExecution.execute(TaskExecution.java:162)
        at org.gradle.internal.execution.steps.ExecuteStep.executeInternal(ExecuteStep.java:105)
        at org.gradle.internal.execution.steps.ExecuteStep.access$000(ExecuteStep.java:44)
        at org.gradle.internal.execution.steps.ExecuteStep$1.call(ExecuteStep.java:59)
        at org.gradle.internal.execution.steps.ExecuteStep$1.call(ExecuteStep.java:56)
        at org.gradle.internal.operations.DefaultBuildOperationRunner$CallableBuildOperationWorker.execute(DefaultBuildOperationRunner.java:200)
        at org.gradle.internal.operations.DefaultBuildOperationRunner$CallableBuildOperationWorker.execute(DefaultBuildOperationRunner.java:195)
        at org.gradle.internal.operations.DefaultBuildOperationRunner$2.execute(DefaultBuildOperationRunner.java:66)
        at org.gradle.internal.operations.DefaultBuildOperationRunner$2.execute(DefaultBuildOperationRunner.java:59)
        at org.gradle.internal.operations.DefaultBuildOperationRunner.execute(DefaultBuildOperationRunner.java:157)
        at org.gradle.internal.operations.DefaultBuildOperationRunner.execute(DefaultBuildOperationRunner.java:59)
        at org.gradle.internal.operations.DefaultBuildOperationRunner.call(DefaultBuildOperationRunner.java:53)
        at org.gradle.internal.operations.DefaultBuildOperationExecutor.call(DefaultBuildOperationExecutor.java:73)
        at org.gradle.internal.execution.steps.ExecuteStep.execute(ExecuteStep.java:56)
        at org.gradle.internal.execution.steps.ExecuteStep.execute(ExecuteStep.java:44)
        at org.gradle.internal.execution.steps.CancelExecutionStep.execute(CancelExecutionStep.java:41)
        at org.gradle.internal.execution.steps.TimeoutStep.executeWithoutTimeout(TimeoutStep.java:74)
        at org.gradle.internal.execution.steps.TimeoutStep.execute(TimeoutStep.java:55)
        at org.gradle.internal.execution.steps.PreCreateOutputParentsStep.execute(PreCreateOutputParentsStep.java:50)
        at org.gradle.internal.execution.steps.PreCreateOutputParentsStep.execute(PreCreateOutputParentsStep.java:28)
        at org.gradle.internal.execution.steps.RemovePreviousOutputsStep.execute(RemovePreviousOutputsStep.java:67)
        at org.gradle.internal.execution.steps.RemovePreviousOutputsStep.execute(RemovePreviousOutputsStep.java:37)
        at org.gradle.internal.execution.steps.BroadcastChangingOutputsStep.execute(BroadcastChangingOutputsStep.java:61)
        at org.gradle.internal.execution.steps.BroadcastChangingOutputsStep.execute(BroadcastChangingOutputsStep.java:26)
        at org.gradle.internal.execution.steps.CaptureOutputsAfterExecutionStep.execute(CaptureOutputsAfterExecutionStep.java:67)
        at org.gradle.internal.execution.steps.CaptureOutputsAfterExecutionStep.execute(CaptureOutputsAfterExecutionStep.java:45)
        at org.gradle.internal.execution.steps.ResolveInputChangesStep.execute(ResolveInputChangesStep.java:40)
        at org.gradle.internal.execution.steps.ResolveInputChangesStep.execute(ResolveInputChangesStep.java:29)
        at org.gradle.internal.execution.steps.BuildCacheStep.executeWithoutCache(BuildCacheStep.java:189)
        at org.gradle.internal.execution.steps.BuildCacheStep.lambda$execute$1(BuildCacheStep.java:75)
        at org.gradle.internal.Either$Right.fold(Either.java:175)
        at org.gradle.internal.execution.caching.CachingState.fold(CachingState.java:62)
        at org.gradle.internal.execution.steps.BuildCacheStep.execute(BuildCacheStep.java:73)
        at org.gradle.internal.execution.steps.BuildCacheStep.execute(BuildCacheStep.java:48)
        at org.gradle.internal.execution.steps.StoreExecutionStateStep.execute(StoreExecutionStateStep.java:46)
        at org.gradle.internal.execution.steps.StoreExecutionStateStep.execute(StoreExecutionStateStep.java:35)
        at org.gradle.internal.execution.steps.SkipUpToDateStep.executeBecause(SkipUpToDateStep.java:76)
        at org.gradle.internal.execution.steps.SkipUpToDateStep.lambda$execute$2(SkipUpToDateStep.java:54)
        at java.base/java.util.Optional.orElseGet(Optional.java:364)
        at org.gradle.internal.execution.steps.SkipUpToDateStep.execute(SkipUpToDateStep.java:54)
        at org.gradle.internal.execution.steps.SkipUpToDateStep.execute(SkipUpToDateStep.java:36)
        at org.gradle.internal.execution.steps.legacy.MarkSnapshottingInputsFinishedStep.execute(MarkSnapshottingInputsFinishedStep.java:37)
        at org.gradle.internal.execution.steps.legacy.MarkSnapshottingInputsFinishedStep.execute(MarkSnapshottingInputsFinishedStep.java:27)
        at org.gradle.internal.execution.steps.ResolveIncrementalCachingStateStep.executeDelegate(ResolveIncrementalCachingStateStep.java:49)
        at org.gradle.internal.execution.steps.ResolveIncrementalCachingStateStep.executeDelegate(ResolveIncrementalCachingStateStep.java:27)
        at org.gradle.internal.execution.steps.AbstractResolveCachingStateStep.execute(AbstractResolveCachingStateStep.java:71)
        at org.gradle.internal.execution.steps.AbstractResolveCachingStateStep.execute(AbstractResolveCachingStateStep.java:39)
        at org.gradle.internal.execution.steps.ResolveChangesStep.execute(ResolveChangesStep.java:65)
        at org.gradle.internal.execution.steps.ResolveChangesStep.execute(ResolveChangesStep.java:36)
        at org.gradle.internal.execution.steps.ValidateStep.execute(ValidateStep.java:106)
        at org.gradle.internal.execution.steps.ValidateStep.execute(ValidateStep.java:55)
        at org.gradle.internal.execution.steps.AbstractCaptureStateBeforeExecutionStep.execute(AbstractCaptureStateBeforeExecutionStep.java:64)
        at org.gradle.internal.execution.steps.AbstractCaptureStateBeforeExecutionStep.execute(AbstractCaptureStateBeforeExecutionStep.java:43)
        at org.gradle.internal.execution.steps.AbstractSkipEmptyWorkStep.executeWithNonEmptySources(AbstractSkipEmptyWorkStep.java:125)
        at org.gradle.internal.execution.steps.AbstractSkipEmptyWorkStep.execute(AbstractSkipEmptyWorkStep.java:56)
        at org.gradle.internal.execution.steps.AbstractSkipEmptyWorkStep.execute(AbstractSkipEmptyWorkStep.java:36)
        at org.gradle.internal.execution.steps.legacy.MarkSnapshottingInputsStartedStep.execute(MarkSnapshottingInputsStartedStep.java:38)
        at org.gradle.internal.execution.steps.LoadPreviousExecutionStateStep.execute(LoadPreviousExecutionStateStep.java:36)
        at org.gradle.internal.execution.steps.LoadPreviousExecutionStateStep.execute(LoadPreviousExecutionStateStep.java:23)
        at org.gradle.internal.execution.steps.HandleStaleOutputsStep.execute(HandleStaleOutputsStep.java:75)
        at org.gradle.internal.execution.steps.HandleStaleOutputsStep.execute(HandleStaleOutputsStep.java:41)
        at org.gradle.internal.execution.steps.AssignMutableWorkspaceStep.lambda$execute$0(AssignMutableWorkspaceStep.java:35)
        at org.gradle.api.internal.tasks.execution.TaskExecution$4.withWorkspace(TaskExecution.java:289)
        at org.gradle.internal.execution.steps.AssignMutableWorkspaceStep.execute(AssignMutableWorkspaceStep.java:31)
        at org.gradle.internal.execution.steps.AssignMutableWorkspaceStep.execute(AssignMutableWorkspaceStep.java:22)
        at org.gradle.internal.execution.steps.ChoosePipelineStep.execute(ChoosePipelineStep.java:40)
        at org.gradle.internal.execution.steps.ChoosePipelineStep.execute(ChoosePipelineStep.java:23)
        at org.gradle.internal.execution.steps.ExecuteWorkBuildOperationFiringStep.lambda$execute$2(ExecuteWorkBuildOperationFiringStep.java:67)
        at java.base/java.util.Optional.orElseGet(Optional.java:364)
        at org.gradle.internal.execution.steps.ExecuteWorkBuildOperationFiringStep.execute(ExecuteWorkBuildOperationFiringStep.java:67)
        at org.gradle.internal.execution.steps.ExecuteWorkBuildOperationFiringStep.execute(ExecuteWorkBuildOperationFiringStep.java:39)
        at org.gradle.internal.execution.steps.IdentityCacheStep.execute(IdentityCacheStep.java:46)
        at org.gradle.internal.execution.steps.IdentityCacheStep.execute(IdentityCacheStep.java:34)
        at org.gradle.internal.execution.steps.IdentifyStep.execute(IdentifyStep.java:48)
        at org.gradle.internal.execution.steps.IdentifyStep.execute(IdentifyStep.java:35)
        at org.gradle.internal.execution.impl.DefaultExecutionEngine$1.execute(DefaultExecutionEngine.java:61)
        at org.gradle.api.internal.tasks.execution.ExecuteActionsTaskExecuter.executeIfValid(ExecuteActionsTaskExecuter.java:127)
        at org.gradle.api.internal.tasks.execution.ExecuteActionsTaskExecuter.execute(ExecuteActionsTaskExecuter.java:116)
        at org.gradle.api.internal.tasks.execution.FinalizePropertiesTaskExecuter.execute(FinalizePropertiesTaskExecuter.java:46)
        at org.gradle.api.internal.tasks.execution.ResolveTaskExecutionModeExecuter.execute(ResolveTaskExecutionModeExecuter.java:51)
        at org.gradle.api.internal.tasks.execution.SkipTaskWithNoActionsExecuter.execute(SkipTaskWithNoActionsExecuter.java:57)
        at org.gradle.api.internal.tasks.execution.SkipOnlyIfTaskExecuter.execute(SkipOnlyIfTaskExecuter.java:74)
        at org.gradle.api.internal.tasks.execution.CatchExceptionTaskExecuter.execute(CatchExceptionTaskExecuter.java:36)
        at org.gradle.api.internal.tasks.execution.EventFiringTaskExecuter$1.executeTask(EventFiringTaskExecuter.java:77)
        at org.gradle.api.internal.tasks.execution.EventFiringTaskExecuter$1.call(EventFiringTaskExecuter.java:55)
        at org.gradle.api.internal.tasks.execution.EventFiringTaskExecuter$1.call(EventFiringTaskExecuter.java:52)
        at org.gradle.internal.operations.DefaultBuildOperationRunner$CallableBuildOperationWorker.execute(DefaultBuildOperationRunner.java:200)
        at org.gradle.internal.operations.DefaultBuildOperationRunner$CallableBuildOperationWorker.execute(DefaultBuildOperationRunner.java:195)
        at org.gradle.internal.operations.DefaultBuildOperationRunner$2.execute(DefaultBuildOperationRunner.java:66)
        at org.gradle.internal.operations.DefaultBuildOperationRunner$2.execute(DefaultBuildOperationRunner.java:59)
        at org.gradle.internal.operations.DefaultBuildOperationRunner.execute(DefaultBuildOperationRunner.java:157)
        at org.gradle.internal.operations.DefaultBuildOperationRunner.execute(DefaultBuildOperationRunner.java:59)
        at org.gradle.internal.operations.DefaultBuildOperationRunner.call(DefaultBuildOperationRunner.java:53)
        at org.gradle.internal.operations.DefaultBuildOperationExecutor.call(DefaultBuildOperationExecutor.java:73)
        at org.gradle.api.internal.tasks.execution.EventFiringTaskExecuter.execute(EventFiringTaskExecuter.java:52)
        at org.gradle.execution.plan.LocalTaskNodeExecutor.execute(LocalTaskNodeExecutor.java:42)
        at org.gradle.execution.taskgraph.DefaultTaskExecutionGraph$InvokeNodeExecutorsAction.execute(DefaultTaskExecutionGraph.java:331)
        at org.gradle.execution.taskgraph.DefaultTaskExecutionGraph$InvokeNodeExecutorsAction.execute(DefaultTaskExecutionGraph.java:318)
        at org.gradle.execution.taskgraph.DefaultTaskExecutionGraph$BuildOperationAwareExecutionAction.lambda$execute$0(DefaultTaskExecutionGraph.java:314)
        at org.gradle.internal.operations.CurrentBuildOperationRef.with(CurrentBuildOperationRef.java:80)
        at org.gradle.execution.taskgraph.DefaultTaskExecutionGraph$BuildOperationAwareExecutionAction.execute(DefaultTaskExecutionGraph.java:314)
        at org.gradle.execution.taskgraph.DefaultTaskExecutionGraph$BuildOperationAwareExecutionAction.execute(DefaultTaskExecutionGraph.java:303)
        at org.gradle.execution.plan.DefaultPlanExecutor$ExecutorWorker.execute(DefaultPlanExecutor.java:463)
        at org.gradle.execution.plan.DefaultPlanExecutor$ExecutorWorker.run(DefaultPlanExecutor.java:380)
        at org.gradle.internal.concurrent.ExecutorPolicy$CatchAndRecordFailures.onExecute(ExecutorPolicy.java:64)
        at org.gradle.internal.concurrent.AbstractManagedExecutor$1.run(AbstractManagedExecutor.java:47)
        at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1144)
        at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:642)
        at java.base/java.lang.Thread.run(Thread.java:1583)

BUILD SUCCESSFUL in 1s
6 actionable tasks: 6 executed
```

## Additional Information

If I remove the first two lines from the ```SQL```, I receive the following exception message:
```
java.lang.IndexOutOfBoundsException: Index -1 out of bounds for length 212
```