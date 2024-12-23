Single Thread Ruby Client
=========================

A Single thread Ruby application sends a Subscriber object using [Google Protocol Buffer](https://protobuf.dev/)

Downloading protobuf compiler

~~~shell
$> sudo apt-get install protobuf-compiler
~~~

Check your protobuf version (it has to be compatible with your 3rd party drivers of Java, Python and Ruby)

~~~shell
$> protoc --version
~~~
Output should be sth like:
~~~shell
libprotoc 3.12.4
~~~
So you should use 3.xx versions of driver libraries for Ruby. You can check the whole versions of protobuf Ruby drivers [here](https://rubygems.org/gems/google-protobuf/versions) I choose `3.25.5` for protoc compiler compatibility.
~~~shell
$> gem install google-protobuf -v 3.25.5
~~~

You can check the downloaded Ruby driver version from `irb`.
~~~shell
$> irb
irb(main):003:0> puts Gem.loaded_specs["google-protobuf"].version
~~~
Output should be sth like:
~~~shell
3.25.5
=> nil
~~~
Use protobuf compiler to generate specific programming language classes. Compile the `subscriber.proto` file in `$PROJECTDIR/src/main/proto`
~~~shell
$> protoc --ruby_out=. student.proto
~~~

Your Ruby project structure might look like this:

~~~shell
SingleThreadRubyClient/
├── subscriber.proto        (the original .proto file)
├── subscriber_pb.rb        (generated by protoc)
└── send_subscriber.rb      (our sending script)
~~~

Good luck
