build-amazonlinux1-gcc72:
	cd amazonlinux1/gcc72 && \
	docker build -t cloudfuse/amazonlinux1-builder:gcc72 .

package-metabase-beanstalk-athena:
	mkdir -p bin && \
	cd metabase-beanstalk-athena && \
	zip -r ../bin/metabase-beanstalk-athena.zip * .[^.]*
