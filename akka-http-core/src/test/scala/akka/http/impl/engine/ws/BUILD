scala_junit_tests(name="junit")

scalatest_tests(
    name="scalatest",
    dependencies=[
      # TODO: Is [overlapped with thirdparty](https://github.com/pantsbuild/pants/issues/13661).
      "akka-http-core/src/test/scala/akka/stream/testkit/Utils.scala",
    ],
)

scala_sources()
