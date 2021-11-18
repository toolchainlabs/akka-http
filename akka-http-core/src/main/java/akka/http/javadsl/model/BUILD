java_sources(
  sources=['*.java', '!HttpCharsetRanges.java', '!HttpProtocols.java', '!RequestEntityAcceptances.java'],
)

# TODO: These might usually be declared via overrides. See https://github.com/pantsbuild/pants/issues/13297.
java_sources(
  name='with_explicit_deps',
  dependencies=[
    # TODO: Used via MODULE$. See https://github.com/pantsbuild/pants/issues/13662
    "akka-http-core/src/main/scala/akka/http/scaladsl/model/HttpCharset.scala",
  ],
  sources=['HttpCharsetRanges.java', 'HttpProtocols.java', 'RequestEntityAcceptances.java'],
)
