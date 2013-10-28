ffiddler
========

**IMPORTANT**: This gem was created on October 28, 2013 as an "emergency" adapter to respond to the sudden folding of the [Ruby FFI][FFI] gem. The maintainer's unexpected removal of support and documentation in response to a licensing controversy has serious implications for the many projects built on top of it.

The goal of **ffiddler** is to fully reproduce the [FFI] gem's API on top of the [fiddle] library, which has been part of Ruby's standard library since 1.9.2 and is also implemented in Rubinius and JRuby. Both libraries wrap the same [libffi] C library, so bridging their APIs *should* allow development of FFI-based projects to continue without major (and risky) overhauls of their external interface code.


Methodology
-----------
Here's what the **ffiddler** project is doing right now:

1. [ ] Copy Aaron Patterson's shim code as a "zero-hour" first step.
2. [ ] Copy *just the specs* from the FFI project (they are explicitly on an [MIT-style license][speclicense]) and see what breaks.
3. [ ] Continue to implement the adapter until all specs pass.
4. [ ] Release publicly and maintain.


[FFI]:https://github.com/ffi/ffi
[fiddle]: http://ruby-doc.org/stdlib-2.0.0/libdoc/fiddle/rdoc/Fiddle.html
[libffi]: http://sourceware.org/libffi/
[speclicense]: https://github.com/ffi/ffi/blob/master/LICENSE.SPECS
