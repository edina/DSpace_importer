DSpace_importer
===============

A simple, light-weight, SWORD Importer derived from the existing DSPaceMETSSIP importer. Applicable to DSpace 1.7, 1.8.1 &amp; 1.8.2

DSpace provide instructions for enabling SWORD (in DSpace 1.8) at http://bit.ly/XFWpHz


Build Notes
===========

- DSpace 1.7.2 must be built with Maven 2.2.X and Java 6
- DSpace 1.8.X can be built with Maven 3.X

Testing
=======
This may be a case of "teaching grandmothers to suck eggs", but just a quick recap on how SWORD works:

In essence, a SWORD deposit is an HTTP POST to a web server, where the header information is used to determine how to handle that request... its almost like a complicated form submission.

So we can test the SWORD Ingester by posting data by hand, which is what we'll do here.

In the _example\ export\ files_ directory there are 4 test files, and the instructions for depositing them.

You can then use a command similar to:

curl -i -u username:password --data-binary "@broker-eprint-323.zip" -H 'X-Packaging: http://opendepot.org/broker/1.0' -H 'Content-Type: application/zip' -A 'RepNet test deposit' http://your.server.foo:port/rjb-sword/deposit/123456789/2

where "username" and "password" are for someone who can log in,
"your.server.foo:port" is the url of your [test] DSpace server, and
"123456789/2" is the collection the deposits will get put into

*NOTE* that the path starts /rjb-sword/ not /sword/

